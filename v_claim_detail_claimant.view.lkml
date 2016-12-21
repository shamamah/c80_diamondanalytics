view: v_claim_detail_claimant {
  sql_table_name: dbo.vClaimDetail_Claimant ;;

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num}) ;;
  }

  dimension: alae_paid {
    type: string
    sql: ${TABLE}.alae_paid ;;
  }

  dimension: alae_reserve {
    type: string
    sql: ${TABLE}.alae_reserve ;;
  }

  dimension: anticipated_expense_recovery {
    type: string
    sql: ${TABLE}.anticipated_expense_recovery ;;
  }

  dimension: anticipated_other_recovery {
    type: string
    sql: ${TABLE}.anticipated_other_recovery ;;
  }

  dimension: anticipated_salvage {
    type: string
    sql: ${TABLE}.anticipated_salvage ;;
  }

  dimension: anticipated_subro {
    type: string
    sql: ${TABLE}.anticipated_subro ;;
  }

  dimension: applicant_num {
    type: number
    sql: ${TABLE}.applicant_num ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_state {
    type: string
    sql: ${TABLE}.city_state ;;
  }

  dimension: claimant_num {
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimantstatus_id {
    type: number
    sql: ${TABLE}.claimantstatus_id ;;
  }

  dimension: claimanttypecode {
    type: string
    sql: ${TABLE}.claimanttypecode ;;
  }

  dimension: claimanttypedscr {
    type: string
    sql: ${TABLE}.claimanttypedscr ;;
  }

  dimension: claimcontrol_id {
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimcontrolproperty_num {
    type: number
    sql: ${TABLE}.claimcontrolproperty_num ;;
  }

  dimension: claimcontrolvehicle_num {
    type: number
    sql: ${TABLE}.claimcontrolvehicle_num ;;
  }

  dimension: display_address {
    type: string
    sql: ${TABLE}.display_address ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: driver_num {
    type: number
    sql: ${TABLE}.driver_num ;;
  }

  dimension: driverexcludetypecode {
    type: string
    sql: ${TABLE}.driverexcludetypecode ;;
  }

  dimension: driverexcludetypedscr {
    type: string
    sql: ${TABLE}.driverexcludetypedscr ;;
  }

  dimension: expense_paid {
    type: string
    sql: ${TABLE}.expense_paid ;;
  }

  dimension: expense_recovery {
    type: string
    sql: ${TABLE}.expense_recovery ;;
  }

  dimension: expense_reserve {
    type: string
    sql: ${TABLE}.expense_reserve ;;
  }

  dimension: in_litigation {
    type: string
    sql: ${TABLE}.in_litigation ;;
  }

  dimension: indemnity_paid {
    type: string
    sql: ${TABLE}.indemnity_paid ;;
  }

  dimension: indemnity_reserve {
    type: string
    sql: ${TABLE}.indemnity_reserve ;;
  }

  dimension: is_insured1 {
    type: string
    sql: ${TABLE}.is_insured1 ;;
  }

  dimension: is_insured2 {
    type: string
    sql: ${TABLE}.is_insured2 ;;
  }

  dimension: is_represented {
    type: string
    sql: ${TABLE}.is_represented ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: other_recovery {
    type: string
    sql: ${TABLE}.other_recovery ;;
  }

  dimension: person {
    type: number
    sql: ${TABLE}.person ;;
  }

  dimension: relationshiptypecode {
    type: string
    sql: ${TABLE}.relationshiptypecode ;;
  }

  dimension: relationshiptypedscr {
    type: string
    sql: ${TABLE}.relationshiptypedscr ;;
  }

  dimension: salvage {
    type: string
    sql: ${TABLE}.salvage ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status_dscr {
    type: string
    sql: ${TABLE}.status_dscr ;;
  }

  dimension: subro {
    type: string
    sql: ${TABLE}.subro ;;
  }

  dimension: taxnum {
    type: string
    sql: ${TABLE}.taxnum ;;
  }

  measure: count {
    type: count
    drill_fields: [name, display_name]
  }
  measure:  sum_indemnity_paid {
    type: sum
    sql: ${indemnity_paid} ;;
  }
  measure:  sum_indemnity_reserve {
    type:  sum
    sql:  ${indemnity_reserve} ;;

  }
  measure: sum_total_incurred{
    type: number
    sql: ${sum_indemnity_paid} + ${sum_indemnity_reserve};;
  }
}
