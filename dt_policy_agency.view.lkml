view: dt_policy_agency {
  derived_table: {
    sql:  select distinct pim.policy_id as 'policy_id', pim.policyimage_num as 'policyimage_num',
                  n.display_name as 'agency_name', a.display_address as 'agency_address', ag.code as 'agency_code'
          from dbo.policyimage pim
              left join dbo.[Agency] ag on ag.agency_id = pim.agency_id
              left join dbo.AgencyNameLink anl on anl.agency_id = pim.agency_id
              left join dbo.[Name] n on n.name_id = anl.name_id
              left join dbo.AgencyAddressLink aal on aal.agency_id = pim.agency_id
              left join dbo.[Address] a on a.address_id = aal.address_id
             ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${policy_id},${policyimage_num}) ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: agency_code {
    label: "Agency Code"
    view_label: "Policy"
    type: string
    sql: ${TABLE}.agency_code ;;
  }

  dimension: agency_name {
    label: "Agency Name"
    view_label: "Policy"
    type: string
    sql: ${TABLE}.agency_name ;;
  }

  dimension: agency_address {
    label: "Agency Address"
    view_label: "Policy"
    type: string
    sql: ${TABLE}.agency_address ;;
  }

}
