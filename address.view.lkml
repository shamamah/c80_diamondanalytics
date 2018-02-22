view: address {
  sql_table_name: dbo.Address ;;

  dimension: address_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: address_num {
    hidden: yes
    type: number
    sql: ${TABLE}.address_num ;;
  }

  dimension: apt_num {
    type: string
    sql: ${TABLE}.apt_num ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: detailstatuscode_id {
    type: number
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  dimension: display_address {
    type: string
    sql: ${TABLE}.display_address ;;
  }

  dimension: house_num {
    type: string
    sql: ${TABLE}.house_num ;;
  }

 dimension: nameaddresssource_id {
    type: number
    sql: ${TABLE}.nameaddresssource_id ;;
  }

  dimension: pobox {
    type: string
    sql: ${TABLE}.pobox ;;
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

  dimension: state_code {
    type: number
    sql: ${TABLE}.state_code ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: street_name {
    type: string
    sql: ${TABLE}.street_name ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  }
