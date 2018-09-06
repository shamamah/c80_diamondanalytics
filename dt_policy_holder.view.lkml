view: dt_policy_holder {
  derived_table: {
    sql: select pil.policy_id, n.display_name, n.first_name, n.middle_name, n.last_name, nas.dscr
      from dbo.PolicyImageNameLink pil
        inner join dbo.[Name] n on n.name_id = pil.name_id
        inner join dbo.NameAddressSource nas on nas.nameaddresssource_id = pil.nameaddresssource_id
      --where n.nameaddresssource_id in (3,4)
      where n.nameaddresssource_id in (3)
      --3 is policy holder 1 and 4 is policy holder 2...We will only retrieve policy holder 1
       ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [detail*]
  # }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policy_holder_1 {
    label: "Insured"
    #label: "Policy Holder 1"
    type: string
    sql: case when ${dscr} = 'Policy Holder 1' then ${TABLE}.display_name else NULL end ;;
  }

  dimension: policy_holder_2 {
    label: "Policy Holder 2"
    hidden: yes
    type: string
    sql: case when ${dscr} = 'Policy Holder 2' then ${TABLE}.display_name else NULL end ;;
    }

  # dimension: first_name {
  #   type: string
  #   sql: ${TABLE}.first_name ;;
  # }

  # dimension: middle_name {
  #   type: string
  #   sql: ${TABLE}.middle_name ;;
  # }

  # dimension: last_name {
  #   type: string
  #   sql: ${TABLE}.last_name ;;
  # }

  dimension: dscr {
    hidden: yes
    type: string
    sql: ${TABLE}.dscr ;;
  }

  # set: detail {
  #   fields: [
  #     policy_id,
  #     display_name,
  #     first_name,
  #     middle_name,
  #     last_name,
  #     dscr
  #   ]
  # }
}
