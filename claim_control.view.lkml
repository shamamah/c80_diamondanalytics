view: claim_control {
  sql_table_name: dbo.ClaimControl ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: ccr1_yesno_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ccr1_yesno_id ;;
  }

  dimension: ccr2_yesno_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ccr2_yesno_id ;;
  }

  dimension: claim_amount_requested {
    type: string
    sql: ${TABLE}.claim_amount_requested ;;
  }

  dimension: claim_number {
    type: string
    sql: ${TABLE}.claim_number ;;
  }

  dimension: claim_type_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claim_type_id ;;
  }

  dimension: claimadministrator_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimadministrator_id ;;
  }

  dimension: claimassistant_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimassistant_id ;;
  }

  dimension: claimcatastrophe_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcatastrophe_id ;;
  }

  dimension: claimclosereason_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimclosereason_id ;;
  }

  dimension: claimcluedisp_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcluedisp_id ;;
  }

  dimension: claimcontact_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontact_id ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimcontrolstatus_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontrolstatus_id ;;
  }

  dimension_group: claimdenial {
    label: "Claim Denial"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.claimdenial_date ;;
  }

  dimension: claimdenialreason_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimdenialreason_id ;;
  }

  dimension: claimdenialreason_remarks {
    label: "Claim Denial Remarks"
    type: string
    sql: ${TABLE}.claimdenialreason_remarks ;;
  }

  dimension: claimdenialusers_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimdenialusers_id ;;
  }

  dimension: claimfault_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimfault_id ;;
  }

  dimension: claimfinancials_num {
    type: number
    hidden: yes
    sql: ${TABLE}.claimfinancials_num ;;
  }

  dimension: claimfiredept_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimfiredept_id ;;
  }

  dimension_group: claimliabilitydecision_added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    hidden: yes
    sql: ${TABLE}.claimliabilitydecision_added_date ;;
  }

  dimension: claimliabilitydecision_percentage {
    type: number
    hidden: yes
    sql: ${TABLE}.claimliabilitydecision_percentage ;;
  }

  dimension: claimliabilitydecision_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimliabilitydecision_user_id ;;
  }

  dimension: claimliabilitydecisiontype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimliabilitydecisiontype_id ;;
  }

  dimension: claimlnimage_num {
    type: number
    hidden: yes
    sql: ${TABLE}.claimlnimage_num ;;
  }

  dimension: claimlnmaster_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimlnmaster_id ;;
  }

  dimension: claimlossdescriptiontype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimlossdescriptiontype_id ;;
  }

  dimension: claimlosstype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimlosstype_id ;;
  }

  dimension: claimoffice_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimoffice_id ;;
  }

  dimension: claimpolicedept_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimpolicedept_id ;;
  }

  dimension: claimpoliceofficer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimpoliceofficer_id ;;
  }

  dimension: claimreportedby_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimreportedby_id ;;
  }

  dimension: claimreportedbymethod_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimreportedbymethod_id ;;
  }

  dimension: claims_made {
    type: string
    hidden: yes
    sql: ${TABLE}.claims_made ;;
  }

  dimension: claimseverity_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimseverity_id ;;
  }

  dimension: client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: destruction {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.destruction_date ;;
  }

  dimension: dscr {
    type: string
    label: "Loss Description"
    sql: ${TABLE}.dscr ;;
  }

  dimension: external_policy_version_number {
    hidden:  yes
    type: number
    sql: ${TABLE}.external_policy_version_number ;;
  }

  dimension: external_policysystem_identifier {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.external_policysystem_identifier ;;
  }

  dimension: fraud_indicator {
    type: string
    sql: ${TABLE}.fraud_indicator ;;
  }

  dimension: has_other_insurance {
    type: yesno
    sql: case when ${TABLE}.has_other_insurance = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: has_public_adjuster {
    type: yesno
    sql: case when ${TABLE}.has_public_adjuster = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: has_related_treatments {
    type: yesno
    sql: case when ${TABLE}.has_related_treatments = 'true' then 'Yes' else 'No' end;;
  }

  dimension: hit_and_run_loss {
    type: yesno
    sql: case when ${TABLE}.hit_and_run_loss = 'true' then 'Yes' else 'No' end ;;
  }

  dimension_group: hospital_admittance {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.hospital_admittance_date ;;
  }

  dimension_group: hospital_discharge {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.hospital_discharge_date ;;
  }

  dimension: hospital_duration_days {
    type: number
    sql: ${TABLE}.hospital_duration_days ;;
  }

  dimension_group: illness_start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.illness_start_date ;;
  }

  dimension: inside_adjuster_id {
    hidden:  yes
    type: number
    sql: ${TABLE}.inside_adjuster_id ;;
  }

  dimension: is_clinic_notified {
    type: yesno
    sql: case when${TABLE}.is_clinic_notified = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: is_converted {
    type: yesno
    sql: case when ${TABLE}.is_converted = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: is_euthanized {
    hidden: yes
    type: string
    sql: ${TABLE}.is_euthanized ;;
  }

  dimension: is_euthanized_vet_advice {
    hidden: yes
    type: string
    sql: ${TABLE}.is_euthanized_vet_advice ;;
  }

  dimension: is_external_policy {
    type: yesno
    sql: case when ${TABLE}.is_external_policy = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: is_policy_verified {
    type: yesno
    sql: case when ${TABLE}.is_policy_verified = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: is_shell_policy {
    type: yesno
    sql: case when ${TABLE}.is_shell_policy = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: is_vacation_cancelled {
    type: string
    hidden: yes
    sql: ${TABLE}.is_vacation_cancelled ;;
  }

  dimension: is_vacation_planned {
    type: string
    hidden: yes
    sql: ${TABLE}.is_vacation_planned ;;
  }

  dimension: last_known_location {
    type: string
    sql: ${TABLE}.last_known_location ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_transaction {
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.last_transaction_date ;;
  }

  dimension: loss_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.loss_address_id ;;
  }

  dimension_group: loss {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.loss_date ;;
  }

  dimension: loss_location {
    type: string
    sql: ${TABLE}.loss_location ;;
  }

  dimension: losstimegiven {
    type: string
    hidden: yes
    sql: ${TABLE}.losstimegiven ;;
  }

  dimension: officer_badge_no {
    type: string
    hidden: yes
    sql: ${TABLE}.officer_badge_no ;;
  }

  dimension_group: original_iso_loss {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    hidden: yes
    sql: ${TABLE}.original_iso_loss_date ;;
  }

  dimension: other_insurance_dscr {
    label: "Other Insurance Description"
    type: string
    sql: ${TABLE}.other_insurance_dscr ;;
  }

  dimension: outside_adjuster_id {
    type: number
    hidden: yes
    sql: ${TABLE}.outside_adjuster_id ;;
  }

  dimension: packagepart_num {
    type: number
    hidden: yes
    sql: ${TABLE}.packagepart_num ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: police_case_no {
    type: string
    hidden: yes
    sql: ${TABLE}.police_case_no ;;
  }

  dimension: police_notified {
    type: yesno
    sql: case when ${TABLE}.police_notified = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden:  yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: previous_claim_number {
    type: string
    sql: ${TABLE}.previous_claim_number ;;
  }

  dimension: previous_loss_indicator {
    type: string
    sql: ${TABLE}.previous_loss_indicator ;;
  }

  dimension: previously_reported {
    type: yesno
    sql: case when ${TABLE}.previously_reported = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: process_medical_bill {
    type: yesno
    sql: case when ${TABLE}.process_medical_bill = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: reinsurance_claim_number {
    type: string
    sql: ${TABLE}.reinsurance_claim_number ;;
  }

  dimension: related_treatment_dscr {
    label: "Related Treatment Description"
    type: string
    sql: ${TABLE}.related_treatment_dscr ;;
  }

  dimension_group: reported {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reported_date ;;
  }

  dimension: reported_to_iso {
    type: string
    hidden: yes
    sql: ${TABLE}.reported_to_iso ;;
  }

  dimension_group: reported_to_iso {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    hidden: yes
    sql: ${TABLE}.reported_to_iso_date ;;
  }

  dimension_group: reported_to_iso_last_submitted {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    hidden: yes
    sql: ${TABLE}.reported_to_iso_last_submitted_date ;;
  }

  dimension: reported_to_iso_update_claim {
    type: string
    hidden: yes
    sql: ${TABLE}.reported_to_iso_update_claim ;;
  }

  dimension: request_claimsdirector_search {
    type: string
    hidden: yes
    sql: ${TABLE}.request_claimsdirector_search ;;
  }

  dimension: single_vehicle_loss {
    type: string
    hidden: yes
    sql: ${TABLE}.single_vehicle_loss ;;
  }

  dimension: siu_indicator {
    type: string
    hidden: yes
    sql: ${TABLE}.siu_indicator ;;
  }

  dimension: submit_to_iso {
    type: string
    hidden: yes
    sql: ${TABLE}.submit_to_iso ;;
  }

  dimension: update_iso_loss_date {
    type: string
    hidden: yes
    sql: ${TABLE}.update_iso_loss_date ;;
  }

  dimension: violation_text {
    type: string
    hidden: yes
    sql: ${TABLE}.violation_text ;;
  }

  dimension: waive_clue_reporting {
    type: string
    hidden: yes
    sql: ${TABLE}.waive_clue_reporting ;;
  }

  dimension: xref_claimadjuster {
    hidden:  yes
    type: string
    sql: ${TABLE}.xref_claimadjuster ;;
  }

  dimension: xref_claimnumber {
    hidden: yes
    type: string
    sql: ${TABLE}.xref_claimnumber ;;
  }

  measure: count {
    type: count

  }
}
