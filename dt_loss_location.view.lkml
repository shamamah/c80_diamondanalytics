view: dt_loss_location {
  derived_table: {
    sql: SELECT ccal.claimcontrol_id, ccal.address_id, a.display_address as 'Loss Address', a.house_num, a.street_name, a.apt_num, a.city, s.[state], a.zip, nas.dscr as 'Location Type'
        FROM [dbo].[ClaimControlAddressLink] ccal
        inner join dbo.[address] a on a.address_id = ccal.address_id
        inner join dbo.NameAddressSource nas on nas.nameaddresssource_id = ccal.nameaddresssource_id
        inner join dbo.[State] s on s.state_id = a.state_id
      where ccal.nameaddresssource_id = 24
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: loss_address {
    type: string
    label: "Loss Address"
    sql: ${TABLE}."Loss Address" ;;
  }

  dimension: house_num {
    type: string
    label: "House Num"
    sql: ${TABLE}.house_num ;;
  }

  dimension: street_name {
      type: string
    label: "Street Name"
    sql: ${TABLE}.street_name ;;
  }

  dimension: apt_num {
    type: string
    label: "Apt Num"
    sql: ${TABLE}.apt_num ;;
  }

  dimension: city {
    type: string
    label: "City"
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    label: "State"
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: string
    label: "Zip"
    sql: ${TABLE}.zip ;;
  }

  dimension: location_type {
    hidden: yes
    type: string
    label: "Location Type"
    sql: ${TABLE}."Location Type" ;;
  }

  set: detail {
    fields: [
      claimcontrol_id,
      address_id,
      location_type,
      loss_address,
      house_num,
      street_name,
      apt_num,
      city,
      state,
      zip
    ]
  }
}
