view: dt_claim_inside_adjuster {
  derived_table: {
    sql:

    select cc.claimcontrol_id
        ,cc.claim_number as "Claim_Number"
        ,cca.last_modified_date as "Assigned_Date"
            ,cp.[enabled] as "Is_Claim_Personnel_Enabled"
        ,cp.initials
        ,cp.claimoffice_id
            ,cpt.claimpersonneltype_id as "claim_personnel_type_id"
        ,cpt.dscr as "ClaimPersonnelType_dscr"
            ,cat.claimadjustertype_id as "claim_adjuster_type_id"
        ,cat.dscr as "ClaimAdjusterType_dscr"
        ,cat.[enabled] as "Is_Adjuster_Enabled"
            ,u.display_name as "Adjuster_Name"
            ,u.active as Active
        ,p.phone_num as "Adjuster_Phone"
        ,u.user_emailaddr as "Adjuster_Email"

    from dbo.ClaimControlPersonnel (NOLOCK) ccp
        left join dbo.ClaimControl (NOLOCK) cc on cc.claimcontrol_id = ccp.claimcontrol_id
        left join dbo.ClaimPersonnel (NOLOCK) cp on cp.claimpersonnel_id = ccp.claimpersonnel_id
        left join dbo.ClaimPersonnelType (NOLOCK) cpt on cpt.claimpersonneltype_id = ccp.claimpersonneltype_id
        left join dbo.ClaimAdjusterType (NOLOCK) cat on cat.claimadjustertype_id = ccp.claimadjustertype_id
        left join dbo.vUsers (NOLOCK) u on u.users_id = cp.users_id
        --SH 2021-06-10  TT 318436 - Join to cca, uel, e, epl, and p to get the requested data
        left join ClaimControlActivity cca on cca.claimcontrol_id = ccp.claimcontrol_id
          --and cca.claimactivitycode_id = 5
          and cca.num = (
                    select max(num)
                    from dbo.claimcontrolactivity cca1
                    where cca1.claimcontrol_id = cca.claimcontrol_id
                      --SH 2021-10-05 - TT 323410 - Correct join to retrieve Examiner Assigned Date
                      and cca1.claimactivitycode_id = 5
                      and cca1.claimpersonneltype_id = 3
                  )
        left join dbo.UserEmployeeLink uel (NOLOCK) on UEL.users_id = u.users_id
        left join dbo.Employee e (NOLOCK) on e.employee_id = uel.employee_id
        left join dbo.EmployeePhoneLink epl (NOLOCK) on epl.employee_id = e.employee_id
        left join dbo.Phone p (NOLOCK) on p.phone_id = epl.phone_id

    where ccp.claimpersonnel_id <> 0
        and cat.[enabled] <> 0
        and cpt.claimpersonneltype_id = 3  --adjusters only
        and cat.claimadjustertype_id = 1   --inside only

       ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

#   dimension: claim_number {
#     type: string
#     sql: ${TABLE}.claim_number ;;
#   }

#   dimension: is_claim_personnel_enabled {
#     type: string
#     sql: ${TABLE}.Is_Claim_Personnel_Enabled ;;
#   }

  dimension: initials {
    label: "Examiner Initials"
    type: string
    sql: case when ${TABLE}.initials IS NULL then '--' else ${TABLE}.initials end ;;
  }

#   dimension: claimoffice_id {
#     type: number
#     sql: ${TABLE}.claimoffice_id ;;
#   }

#   dimension: claim_personnel_type_id {
#     type: number
#     sql: ${TABLE}.claim_personnel_type_id ;;
#   }

#   dimension: claim_personnel_type_dscr {
#     type: string
#     sql: ${TABLE}.ClaimPersonnelType_dscr ;;
#   }

#   dimension: claim_adjuster_type_id {
#     type: number
#     sql: ${TABLE}.claim_adjuster_type_id ;;
#   }

#   dimension: claim_adjuster_type_dscr {
#     type: string
#     sql: ${TABLE}.ClaimAdjusterType_dscr ;;
#   }

#   dimension: is_adjuster_enabled {
#     type: string
#     sql: ${TABLE}.Is_Adjuster_Enabled ;;
#   }

  dimension: adjuster_name {
    label: "Examiner"
    type: string
    sql: case when ${TABLE}.Adjuster_Name IS NULL then 'Unassigned' else ${TABLE}.Adjuster_Name end ;;
  }

  dimension: active {
    label: "Examiner Active (Yes/No)"
    type: string
    sql: case when ${TABLE}.Active=1 then 'Yes' else (case when ${TABLE}.Active=0 then 'No' else 'N/A' end) end ;;
  }

  #SH 2021-06-10  TT 318436 - Join to cca, uel, e, epl, and p to get the requested data
  dimension: adjuster_phone {
    label: "Examiner Phone"
    type: string
    sql: ${TABLE}.adjuster_phone ;;
  }

  dimension: adjuster_email {
    label: "Examiner Email"
    type: string
    sql: ${TABLE}.adjuster_email ;;
  }

  dimension_group: assigned_date {
    label: "Examiner Assigned"
    type: time
    timeframes: [date,week,month,year]
    sql: ${TABLE}.assigned_date ;;
  }
}
