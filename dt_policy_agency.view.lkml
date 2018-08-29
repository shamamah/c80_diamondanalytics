view: dt_policy_agency {
  derived_table: {
    sql: select pim.policy_id as 'policy_id', n.display_name as 'agency_name'
      from dbo.policyimage pim
        inner join dbo.AgencyNameLink anl on anl.agency_id = pim.agency_id
        inner join dbo.[Name] n on n.name_id = anl.name_id
       ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: policy_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: agency_name {
    label: "Agency"
    view_label: "Policy"
    type: string
    sql: ${TABLE}.agency_name ;;
  }

#   set: detail {
#     fields: [policy_id, agency_name]
#   }
}
