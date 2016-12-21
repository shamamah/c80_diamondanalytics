view: policy_level {
  sql_table_name: dbo.PolicyLevel ;;

  dimension: aacs_claim_incident_score {
    type: number
    sql: ${TABLE}.aacs_claim_incident_score ;;
  }

  dimension: aacs_credit_score_numeric {
    type: number
    sql: ${TABLE}.aacs_credit_score_numeric ;;
  }

  dimension: aacs_creditscore {
    type: string
    sql: ${TABLE}.aacs_creditscore ;;
  }

  dimension: aacs_major_incident_score {
    type: number
    sql: ${TABLE}.aacs_major_incident_score ;;
  }

  dimension: aacs_minor_incident_score {
    type: number
    sql: ${TABLE}.aacs_minor_incident_score ;;
  }

  dimension: aacs_name_id {
    type: number
    sql: ${TABLE}.aacs_name_id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: additional_scheduled_rating_credibility_factor {
    type: string
    sql: ${TABLE}.additional_scheduled_rating_credibility_factor ;;
  }

  dimension: aggregate_limit {
    type: string
    sql: ${TABLE}.aggregate_limit ;;
  }

  dimension: aggregateliabilityincrementtype_id {
    type: number
    sql: ${TABLE}.aggregateliabilityincrementtype_id ;;
  }

  dimension: anniversary_credit {
    type: string
    sql: ${TABLE}.anniversary_credit ;;
  }

  dimension_group: anniversary_credit {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.anniversary_credit_date ;;
  }

  dimension_group: anniversary_rating_effective {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.anniversary_rating_effective_date ;;
  }

  dimension_group: anniversary_rating_expiration {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.anniversary_rating_expiration_date ;;
  }

  dimension: auto_home {
    type: string
    sql: ${TABLE}.auto_home ;;
  }

  dimension: average_policy_score {
    type: number
    sql: ${TABLE}.average_policy_score ;;
  }

  dimension: cargo_number {
    type: string
    sql: ${TABLE}.cargo_number ;;
  }

  dimension: catastropheexposuretype_id {
    type: number
    sql: ${TABLE}.catastropheexposuretype_id ;;
  }

  dimension: companion_policy_number {
    type: string
    sql: ${TABLE}.companion_policy_number ;;
  }

  dimension: company_discount {
    type: string
    sql: ${TABLE}.company_discount ;;
  }

  dimension: consent_to_order_ncf {
    type: number
    sql: ${TABLE}.consent_to_order_ncf ;;
  }

  dimension: coverage_default_plan_applied {
    type: string
    sql: ${TABLE}.coverage_default_plan_applied ;;
  }

  dimension: coveragetype_id {
    type: number
    sql: ${TABLE}.coveragetype_id ;;
  }

  dimension: current_insurance_carrier {
    type: string
    sql: ${TABLE}.current_insurance_carrier ;;
  }

  dimension_group: current_policy_exp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.current_policy_exp_date ;;
  }

  dimension: current_premium {
    type: string
    sql: ${TABLE}.current_premium ;;
  }

  dimension: deductiblepertype_id {
    type: number
    sql: ${TABLE}.deductiblepertype_id ;;
  }

  dimension: detailstatuscode_id {
    type: number
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  dimension: diamondlevel_id {
    type: number
    sql: ${TABLE}.diamondlevel_id ;;
  }

  dimension: docket_number {
    type: string
    sql: ${TABLE}.docket_number ;;
  }

  dimension: dot_number {
    type: string
    sql: ${TABLE}.dot_number ;;
  }

  dimension_group: drivecam_contract_eff {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.drivecam_contract_eff_date ;;
  }

  dimension: drivecamcontracttype_id {
    type: number
    sql: ${TABLE}.drivecamcontracttype_id ;;
  }

  dimension: employee_discount {
    type: string
    sql: ${TABLE}.employee_discount ;;
  }

  dimension: employees_fulltime {
    type: number
    sql: ${TABLE}.employees_fulltime ;;
  }

  dimension: employees_parttime_1_40_days {
    type: number
    sql: ${TABLE}.employees_parttime_1_40_days ;;
  }

  dimension: employees_parttime_41_179_days {
    type: number
    sql: ${TABLE}.employees_parttime_41_179_days ;;
  }

  dimension: employer_name {
    type: string
    sql: ${TABLE}.employer_name ;;
  }

  dimension: employerbusinesstype_id {
    type: number
    sql: ${TABLE}.employerbusinesstype_id ;;
  }

  dimension: enhancement_endorsement {
    type: string
    sql: ${TABLE}.enhancement_endorsement ;;
  }

  dimension: entitytype_id {
    type: number
    sql: ${TABLE}.entitytype_id ;;
  }

  dimension: expanded_authority {
    type: string
    sql: ${TABLE}.expanded_authority ;;
  }

  dimension: expenseconstant {
    type: string
    sql: ${TABLE}.expenseconstant ;;
  }

  dimension: extended_authority {
    type: string
    sql: ${TABLE}.extended_authority ;;
  }

  dimension: facultative_reinsurance {
    type: string
    sql: ${TABLE}.facultative_reinsurance ;;
  }

  dimension: farmsizetype_id {
    type: number
    sql: ${TABLE}.farmsizetype_id ;;
  }

  dimension: farmtype_id {
    type: number
    sql: ${TABLE}.farmtype_id ;;
  }

  dimension: federal_employee {
    type: string
    sql: ${TABLE}.federal_employee ;;
  }

  dimension: fewer_autos {
    type: string
    sql: ${TABLE}.fewer_autos ;;
  }

  dimension: figa {
    type: string
    sql: ${TABLE}.figa ;;
  }

  dimension: figa_nine {
    type: string
    sql: ${TABLE}.figa_nine ;;
  }

  dimension: figa_seven {
    type: string
    sql: ${TABLE}.figa_seven ;;
  }

  dimension: figa_six {
    type: string
    sql: ${TABLE}.figa_six ;;
  }

  dimension: figa_twelve {
    type: string
    sql: ${TABLE}.figa_twelve ;;
  }

  dimension: file_number {
    type: string
    sql: ${TABLE}.file_number ;;
  }

  dimension: filing_limit {
    type: number
    sql: ${TABLE}.filing_limit ;;
  }

  dimension: fleet_rate {
    type: string
    sql: ${TABLE}.fleet_rate ;;
  }

  dimension: florida_recoupment {
    type: string
    sql: ${TABLE}.florida_recoupment ;;
  }

  dimension: florida_recoupment_five {
    type: string
    sql: ${TABLE}.florida_recoupment_five ;;
  }

  dimension: formtype_id {
    type: number
    sql: ${TABLE}.formtype_id ;;
  }

  dimension: good_driver_policy {
    type: string
    sql: ${TABLE}.good_driver_policy ;;
  }

  dimension: grouptype_dscr {
    type: string
    sql: ${TABLE}.grouptype_dscr ;;
  }

  dimension: grouptype_id {
    type: number
    sql: ${TABLE}.grouptype_id ;;
  }

  dimension: has_fmcsa_filing {
    type: string
    sql: ${TABLE}.has_fmcsa_filing ;;
  }

  dimension: has_state_federal_filings {
    type: string
    sql: ${TABLE}.has_state_federal_filings ;;
  }

  dimension: hoform_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.hoform_id ;;
  }

  dimension: hurricane_premium {
    type: string
    sql: ${TABLE}.hurricane_premium ;;
  }

  dimension: insurance_score_credit_level_rank {
    type: number
    sql: ${TABLE}.insurance_score_credit_level_rank ;;
  }

  dimension: insurancelapsed_id {
    type: number
    sql: ${TABLE}.insurancelapsed_id ;;
  }

  dimension: is_anniversary_credit_date_overridden {
    type: string
    sql: ${TABLE}.is_anniversary_credit_date_overridden ;;
  }

  dimension: is_brands_and_labels {
    type: string
    sql: ${TABLE}.is_brands_and_labels ;;
  }

  dimension: is_church_extender {
    type: string
    sql: ${TABLE}.is_church_extender ;;
  }

  dimension: is_contractors_enhancement {
    type: string
    sql: ${TABLE}.is_contractors_enhancement ;;
  }

  dimension: is_manufacturers_enhancement {
    type: string
    sql: ${TABLE}.is_manufacturers_enhancement ;;
  }

  dimension: is_molten_material {
    type: string
    sql: ${TABLE}.is_molten_material ;;
  }

  dimension: is_proxycard_returned {
    type: string
    sql: ${TABLE}.is_proxycard_returned ;;
  }

  dimension: is_relocation_only {
    type: string
    sql: ${TABLE}.is_relocation_only ;;
  }

  dimension: is_surcharge_lenience {
    type: string
    sql: ${TABLE}.is_surcharge_lenience ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: liability_number {
    type: string
    sql: ${TABLE}.liability_number ;;
  }

  dimension: liabilityoption_id {
    type: number
    sql: ${TABLE}.liabilityoption_id ;;
  }

  dimension: limitedperilscategorytype_id {
    type: number
    sql: ${TABLE}.limitedperilscategorytype_id ;;
  }

  dimension: location_count {
    type: number
    sql: ${TABLE}.location_count ;;
  }

  dimension: loss_history {
    type: string
    sql: ${TABLE}.loss_history ;;
  }

  dimension: manually_created_client_identifier {
    type: string
    sql: ${TABLE}.manually_created_client_identifier ;;
  }

  dimension: maximum_credit_applied_chk {
    type: string
    sql: ${TABLE}.maximum_credit_applied_chk ;;
  }

  dimension: mexico_coverage {
    type: string
    sql: ${TABLE}.mexico_coverage ;;
  }

  dimension: months_rate {
    type: string
    sql: ${TABLE}.months_rate ;;
  }

  dimension: multiline_discount {
    type: number
    sql: ${TABLE}.multiline_discount ;;
  }

  dimension: multiline_discount_auto {
    type: string
    sql: ${TABLE}.multiline_discount_auto ;;
  }

  dimension: nonhurricane_premium {
    type: string
    sql: ${TABLE}.nonhurricane_premium ;;
  }

  dimension: nonwind_premium {
    type: string
    sql: ${TABLE}.nonwind_premium ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: number_of_self_propelled_autos {
    type: number
    sql: ${TABLE}.number_of_self_propelled_autos ;;
  }

  dimension: override_filing_limit {
    type: string
    sql: ${TABLE}.override_filing_limit ;;
  }

  dimension: package_credit {
    type: string
    sql: ${TABLE}.package_credit ;;
  }

  dimension: packagemodificationassignmenttype_id {
    type: number
    sql: ${TABLE}.packagemodificationassignmenttype_id ;;
  }

  dimension: packagepart_num {
    type: number
    sql: ${TABLE}.packagepart_num ;;
  }

  dimension: packagetype_id {
    type: number
    sql: ${TABLE}.packagetype_id ;;
  }

  dimension: paid_in_full_credit {
    type: string
    sql: ${TABLE}.paid_in_full_credit ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: persistency {
    type: string
    sql: ${TABLE}.persistency ;;
  }

  dimension: policy_fee_amount {
    type: string
    sql: ${TABLE}.policy_fee_amount ;;
  }

  dimension: policy_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyfeetype_id {
    type: number
    sql: ${TABLE}.policyfeetype_id ;;
  }

  dimension: policyimage_num {
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: policylevel_num {
    type: number
    sql: ${TABLE}.policylevel_num ;;
  }

  dimension: policytype_id {
    type: number
    sql: ${TABLE}.policytype_id ;;
  }

  dimension: predictive_score {
    type: number
    sql: ${TABLE}.predictive_score ;;
  }

  dimension: predictivescoregrouptype_id {
    type: number
    sql: ${TABLE}.predictivescoregrouptype_id ;;
  }

  dimension: premium_chg_written {
    type: string
    sql: ${TABLE}.premium_chg_written ;;
  }

  dimension: premium_discount {
    type: string
    sql: ${TABLE}.premium_discount ;;
  }

  dimension: premium_fullterm {
    type: string
    sql: ${TABLE}.premium_fullterm ;;
  }

  dimension: premium_written {
    type: string
    sql: ${TABLE}.premium_written ;;
  }

  dimension: previousinsurer_id {
    type: number
    sql: ${TABLE}.previousinsurer_id ;;
  }

  dimension: prior_carrier {
    type: string
    sql: ${TABLE}.prior_carrier ;;
  }

  dimension: programtype_id {
    type: number
    sql: ${TABLE}.programtype_id ;;
  }

  dimension: qualifies_for_scheduled_rating {
    type: string
    sql: ${TABLE}.qualifies_for_scheduled_rating ;;
  }

  dimension: rate_no_reports {
    type: string
    sql: ${TABLE}.rate_no_reports ;;
  }

  dimension: ratingsourcetype_id {
    type: number
    sql: ${TABLE}.ratingsourcetype_id ;;
  }

  dimension: referral_dscr {
    type: string
    sql: ${TABLE}.referral_dscr ;;
  }

  dimension: referral_needed {
    type: string
    sql: ${TABLE}.referral_needed ;;
  }

  dimension: referralapprovedby_id {
    type: number
    sql: ${TABLE}.referralapprovedby_id ;;
  }

  dimension: referralreasontype_id {
    type: number
    sql: ${TABLE}.referralreasontype_id ;;
  }

  dimension: referraltype_id {
    type: number
    sql: ${TABLE}.referraltype_id ;;
  }

  dimension: renewal_credit {
    type: string
    sql: ${TABLE}.renewal_credit ;;
  }

  dimension: riskgrade {
    type: string
    sql: ${TABLE}.riskgrade ;;
  }

  dimension: riskgradelookup_id {
    type: number
    sql: ${TABLE}.riskgradelookup_id ;;
  }

  dimension: roadside_membership {
    type: string
    sql: ${TABLE}.roadside_membership ;;
  }

  dimension: scheduled_rating_credibility {
    type: string
    sql: ${TABLE}.scheduled_rating_credibility ;;
  }

  dimension: select_market_credit {
    type: string
    sql: ${TABLE}.select_market_credit ;;
  }

  dimension: tiertype_id {
    type: number
    sql: ${TABLE}.tiertype_id ;;
  }

  dimension: unacceptable_risk {
    type: string
    sql: ${TABLE}.unacceptable_risk ;;
  }

  dimension: wind_premium {
    type: string
    sql: ${TABLE}.wind_premium ;;
  }

  measure: count {
    type: count
    drill_fields: [employer_name, policy.rewrittenfrom_policy_id, hoform.hoform_id]
  }
}
