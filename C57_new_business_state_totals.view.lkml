view: c57_new_business_state_totals {
  label: "New Business State Totals"
  derived_table: {
    sql:
      SELECT PIM.policy_id
      ,      PIM.policy
      ,      PIM.premium_fullterm
      ,      VEH.territory_num
      ,      S.state
      ,      A.zip
      FROM       Diamond.dbo.PolicyImage PIM WITH(NOLOCK)
      INNER JOIN Diamond.dbo.Version     V WITH(NOLOCK)   ON V.version_id = PIM.version_id
      INNER JOIN Diamond.dbo.Vehicle     VEH WITH(NOLOCK) ON VEH.policy_id = PIM.policy_id
      INNER JOIN Diamond.dbo.Address     A WITH(NOLOCK)   ON A.policy_id = PIM.policy_id
      INNER JOIN Diamond.dbo.State       S WITH(NOLOCK)   ON S.state_id = A.state_id
      WHERE PIM.transtype_id IN (2) -- New Business
        AND PIM.policystatuscode_id NOT IN (4,5,8,9,10,11,12,13)
        AND PIM.trans_date BETWEEN {% parameter start_date %} AND {% parameter end_date %}
      GROUP BY PIM.policy_id
      ,        PIM.policy
      ,        PIM.premium_fullterm
      ,        VEH.territory_num
      ,        S.state
      ,        A.zip
       ;;
  }

  dimension: policy_id {
    type: number
    hidden:  yes
    primary_key: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policy {
    type: string
    sql: ${TABLE}.policy ;;
  }

  dimension: territory_num {
    type: number
    sql: ${TABLE}.territory_num ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: LEFT(${TABLE}.zip,5) ;;
  }

  parameter: start_date {
    type: date
  }

  parameter: end_date {
    type: date
  }

  set: detail_count {
    fields: [state, policy, premium_fullterm]
  }

  measure: premium_fullterm{
    type: sum
    value_format_name: usd
    sql: ${TABLE}.premium_fullterm ;;
  }

  measure: count {
    type: count
    drill_fields: [detail_count*]
  }

}
