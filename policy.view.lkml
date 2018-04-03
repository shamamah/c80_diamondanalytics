view: policy {
  sql_table_name: dbo.Policy ;;

  dimension: rewrittenfrom_policy_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.rewrittenfrom_policy_id ;;
  }

  dimension: account_num {
    type: number
    sql: ${TABLE}.account_num ;;
  }

  dimension: activeimage_num {
    type: number
    sql: ${TABLE}.activeimage_num ;;
  }

  dimension_group: added {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: agencybooktransferstatus_id {
    type: number
    sql: ${TABLE}.agencybooktransferstatus_id ;;
  }

  dimension: automancancel {
    type: number
    sql: ${TABLE}.automancancel ;;
  }

  dimension_group: automancancel {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.automancancel_date ;;
  }

  dimension: automancancelnotice {
    type: number
    sql: ${TABLE}.automancancelnotice ;;
  }

  dimension_group: automancancelnotice {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.automancancelnotice_date ;;
  }

  dimension: billingaccount_id {
    type: number
    sql: ${TABLE}.billingaccount_id ;;
  }

  dimension_group: binder {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.binder_date ;;
  }

  dimension_group: cancel {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.cancel_date ;;
  }

  dimension: cancelimage_num {
    type: number
    sql: ${TABLE}.cancelimage_num ;;
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension_group: cancelledon {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.cancelledon_date ;;
  }

  dimension_group: carry {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.carry_date ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: collection_notice {
    type: number
    sql: ${TABLE}.collection_notice ;;
  }

  dimension: current_policy {
    type: string
    sql: ${TABLE}.current_policy ;;
  }

  dimension: current_policy_isquoteno {
    type: string
    sql: ${TABLE}.current_policy_isquoteno ;;
  }

  dimension: do_not_reinstate {
    type: string
    sql: ${TABLE}.do_not_reinstate ;;
  }

  dimension: exclude_from_collections {
    type: string
    sql: ${TABLE}.exclude_from_collections ;;
  }

  dimension: external_agency_pds {
    type: string
    sql: ${TABLE}.external_agency_pds ;;
  }

  dimension: external_book_roll_accommodation {
    type: string
    sql: ${TABLE}.external_book_roll_accommodation ;;
  }

  dimension: external_book_roll_indicator {
    type: string
    sql: ${TABLE}.external_book_roll_indicator ;;
  }

  dimension: external_broker_account {
    type: string
    sql: ${TABLE}.external_broker_account ;;
  }

  dimension: external_broker_rep_pds_number {
    type: string
    sql: ${TABLE}.external_broker_rep_pds_number ;;
  }

  dimension: external_ea {
    type: string
    sql: ${TABLE}.external_ea ;;
  }

  dimension: external_express_link {
    type: string
    sql: ${TABLE}.external_express_link ;;
  }

  dimension: external_policy_carrier_version {
    type: string
    sql: ${TABLE}.external_policy_carrier_version ;;
  }

  dimension: external_policy_source {
    type: string
    sql: ${TABLE}.external_policy_source ;;
  }

  dimension: external_producer_state {
    type: string
    sql: ${TABLE}.external_producer_state ;;
  }

  dimension: external_producer_type {
    type: string
    sql: ${TABLE}.external_producer_type ;;
  }

  dimension: external_submission_num {
    type: string
    sql: ${TABLE}.external_submission_num ;;
  }

  dimension: external_submitter_type {
    type: string
    sql: ${TABLE}.external_submitter_type ;;
  }

  dimension: external_underwriter {
    type: string
    sql: ${TABLE}.external_underwriter ;;
  }

  dimension: fcra_yesno_id {
    type: number
    sql: ${TABLE}.fcra_yesno_id ;;
  }

  dimension: finalcancelnotice {
    type: number
    sql: ${TABLE}.finalcancelnotice ;;
  }

  dimension_group: first_eff {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_eff_date ;;
  }

  dimension_group: first_eff {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_eff_time ;;
  }

  dimension_group: first_quote {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_quote_date ;;
  }

  dimension_group: firstwritten {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.firstwritten_date ;;
  }

  dimension: futurecancel {
    type: string
    sql: ${TABLE}.futurecancel ;;
  }

  dimension: hurricaneblackout_id {
    type: number
    sql: ${TABLE}.hurricaneblackout_id ;;
  }

  dimension_group: invoice_reminder {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_reminder_date ;;
  }

  dimension: invoiceremindernoticestatustype_id {
    type: number
    sql: ${TABLE}.invoiceremindernoticestatustype_id ;;
  }

  dimension: is_billing_only {
    type: string
    sql: ${TABLE}.is_billing_only ;;
  }

  dimension: is_converted_policy {
    type: string
    sql: ${TABLE}.is_converted_policy ;;
  }

  dimension: iscurrentlybound {
    type: string
    sql: ${TABLE}.iscurrentlybound ;;
  }

  dimension: ivr_exclusion {
    type: string
    sql: ${TABLE}.ivr_exclusion ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: lastimage_num {
    type: number
    sql: ${TABLE}.lastimage_num ;;
  }

  dimension: legacy_policynumber {
    type: string
    sql: ${TABLE}.legacy_policynumber ;;
  }

  dimension: legal_cancel_count {
    type: number
    sql: ${TABLE}.legal_cancel_count ;;
  }

  dimension_group: legalcancel {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.legalcancel_date ;;
  }

  dimension: legalcancelnotice {
    type: number
    sql: ${TABLE}.legalcancelnotice ;;
  }

  dimension: locked {
    type: string
    sql: ${TABLE}.locked ;;
  }

  dimension_group: locked_last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.locked_last_modified_date ;;
  }

  dimension: nonpay_cancel_count {
    type: number
    sql: ${TABLE}.nonpay_cancel_count ;;
  }

  dimension: nonrenew {
    type: number
    sql: ${TABLE}.nonrenew ;;
  }

  dimension_group: nonrenew {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.nonrenew_date ;;
  }

  dimension: nonrenewnotice {
    type: number
    sql: ${TABLE}.nonrenewnotice ;;
  }

  dimension_group: nonrenewnotice {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.nonrenewnotice_date ;;
  }

  dimension: nonrenewreason_id {
    type: number
    sql: ${TABLE}.nonrenewreason_id ;;
  }

  dimension_group: odencancel {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.odencancel_date ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: policy_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policycurrentstatus_id {
    type: number
    sql: ${TABLE}.policycurrentstatus_id ;;
  }

  dimension: policyorigintype_id {
    type: number
    sql: ${TABLE}.policyorigintype_id ;;
  }

  dimension: premium_target {
    type: string
    sql: ${TABLE}.premium_target ;;
  }

  dimension: preprocessrenewal_completed {
    type: string
    sql: ${TABLE}.preprocessrenewal_completed ;;
  }

  dimension: quotesource_id {
    type: number
    sql: ${TABLE}.quotesource_id ;;
  }

  dimension: referred_by_addl_info {
    type: string
    sql: ${TABLE}.referred_by_addl_info ;;
  }

  dimension_group: reminder {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.reminder_date ;;
  }

  dimension: remindernotice {
    type: number
    sql: ${TABLE}.remindernotice ;;
  }

  dimension_group: renewalexpiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.renewalexpiration_date ;;
  }

  dimension: renewalexpirationnotice {
    type: number
    sql: ${TABLE}.renewalexpirationnotice ;;
  }

  dimension: restrictedpolicytype_id {
    type: number
    sql: ${TABLE}.restrictedpolicytype_id ;;
  }

  dimension: rewrittenfrom_policy {
    type: string
    sql: ${TABLE}.rewrittenfrom_policy ;;
  }

  dimension: rewrittenfrom_policyimage_num {
    type: number
    sql: ${TABLE}.rewrittenfrom_policyimage_num ;;
  }

  dimension: rollto_companystatelob_id {
    type: number
    sql: ${TABLE}.rollto_companystatelob_id ;;
  }

  dimension: salescenter_contact_id {
    type: number
    sql: ${TABLE}.salescenter_contact_id ;;
  }

  dimension: saq_originated {
    type: string
    sql: ${TABLE}.saq_originated ;;
  }

  dimension: underwritingtype_id {
    type: number
    sql: ${TABLE}.underwritingtype_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      rewrittenfrom_policy_id,
      policy.rewrittenfrom_policy_id,
      client.client_id,
      accounting_batch_waive.count,
      accounting_lockbox_detail.count,
      accounting_pay_queue.count,
      additional_dwelling.count,
      additional_dwelling_address_link.count,
      additional_dwelling_policy_form_link.count,
      additional_insured.count,
      additional_insured_address_link.count,
      additional_insured_coverage_link.count,
      additional_insured_email_link.count,
      additional_insured_name_link.count,
      additional_insured_phone_link.count,
      additional_interest.count,
      additional_interest_form_link.count,
      additional_interest_policy_form_link.count,
      additional_location.count,
      additional_location_address_link.count,
      additional_location_coverage.count,
      additional_location_name_link.count,
      additional_policyholder.count,
      additional_policyholder_address_link.count,
      additional_policyholder_email_link.count,
      additional_policyholder_name_link.count,
      additional_policyholder_phone_link.count,
      address.count,
      address_geo_code_info.count,
      address_peril_info.count,
      address_verification_transmission.count,
      add_scheduled_persons.count,
      adverse_underwriting.count,
      agency_activity.count,
      agency_activity_diagnosis.count,
      agency_book_transfer_policy_link.count,
      aging_detail.count,
      aircraft.count,
      aircraft_policy_form_link.count,
      analytics_process_duration.count,
      aplus_result.count,
      aplus_result_address_link.count,
      aplus_result_name_link.count,
      applicant.count,
      applicant_address_link.count,
      applicant_credit_score_link.count,
      applicant_email_link.count,
      applicant_employment_link.count,
      applicant_loss_history_link.count,
      applicant_name_link.count,
      applicant_phone_link.count,
      applicant_residence_info_link.count,
      applicant_tiering_info_link.count,
      approval_rules.count,
      archive_policy_work.count,
      auto_questions.count,
      auto_symbol.count,
      auto_symbol_description.count,
      billing_account_cash_detail.count,
      billing_account_invoice.count,
      billing_acct_receivable.count,
      billing_acct_receivable_daily.count,
      billing_acct_receivable_monthly.count,
      billing_acct_receivable_monthly_detail.count,
      billing_acct_receivable_monthly_detail_status_info.count,
      billing_acct_receivable_monthly_detail_status_info_excludes.count,
      billing_activity_order.count,
      billing_audit_billing_acct_receivable.count,
      billing_audit_billing_cash.count,
      billing_audit_billing_charge_credit.count,
      billing_cash.count,
      billing_cash_credit_card.count,
      billing_cash_detail.count,
      billing_cash_mchg_detail.count,
      billing_charge_credit.count,
      billing_future_cash.count,
      billing_future_notice.count,
      billing_history.count,
      billing_installment.count,
      billing_installment_cancel_fee_detail.count,
      billing_installment_detail.count,
      billing_installment_percentage.count,
      billing_invoice.count,
      billing_invoice_due_date.count,
      billing_invoice_image.count,
      billing_notice.count,
      blanket_rating.count,
      breakout.count,
      breakout_detail.count,
      building_additions.count,
      building_additions_address_link.count,
      building_additions_policy_form_link.count,
      building_class_information.count,
      building_information.count,
      business_activities.count,
      business_owners_information_other_than_contractors.count,
      canine_information.count,
      care_provided_for_others.count,
      check_item.count,
      choice_point_ncfbatch.count,
      choice_point_ncfbatch_work.count,
      choice_point_ncfbatch_work2.count,
      choice_point_transmission_auto.count,
      choice_point_transmission_auto_data_prefill.count,
      choice_point_transmission_credit_score_link.count,
      choice_point_transmission_driver.count,
      choice_point_transmission_driver_choice_point_mismatch_indicator_type_link.count,
      choice_point_transmission_driver_license_information.count,
      choice_point_transmission_location.count,
      choice_point_transmission_saq.count,
      choice_point_transmission_vehicle.count,
      claimant_policy_form_link.count,
      claim_control.count,
      claim_control_policy_form_link.count,
      claim_feature_policy_form_link.count,
      claim_ln_image.count,
      claim_transaction_policy_form_link.count,
      class_codes.count,
      classification.count,
      classification_code.count,
      classification_code_coverage_link.count,
      classification_coverage_link.count,
      classification_policy_underwriting_link.count,
      client_rules_activity.count,
      commercial.count,
      commercial_farm.count,
      commercial_farm_additional_interest_link.count,
      commercial_farm_coverage_link.count,
      commercial_farm_credit_score_link.count,
      commercial_farm_form_link.count,
      commercial_farm_prior_carrier_link.count,
      commercial_farm_residence_info_link.count,
      commercial_farm_scheduled_items_link.count,
      commission_contribution.count,
      condo_rental_supplement.count,
      contact_information.count,
      contact_information_email_link.count,
      contact_information_name_link.count,
      contact_information_phone_link.count,
      coverage.count,
      coverage_add_info.count,
      coverage_add_info_link.count,
      coverage_additional_info.count,
      coverage_additional_interest_link.count,
      coverage_address_detail_address_link.count,
      coverage_detail.count,
      coverage_form_link.count,
      coverage_policy_form_link.count,
      coverage_policy_forms_link.count,
      coverage_rating_version.count,
      coverage_sub_coverage_link.count,
      credit_card_data.count,
      credit_debits.count,
      credit_factor.count,
      credits_and_debits.count,
      credit_score.count,
      credit_score_reason.count,
      ctrbreakout.count,
      current_carrier.count,
      cust_equip.count,
      deleted_non_renew_events.count,
      dhitransmission.count,
      dmvreported_vehicles.count,
      dmvresubmit_policy_image.count,
      download.count,
      driver.count,
      driver_address_link.count,
      driver_coverage_link.count,
      driver_credit_score_link.count,
      driver_distant_student.count,
      driver_email_link.count,
      driver_employment_link.count,
      driver_extended_non_owned.count,
      driver_form_link.count,
      driver_iixtransmission_link.count,
      driver_loss_history_link.count,
      driver_modifier_link.count,
      driver_name_link.count,
      driver_phone_link.count,
      driver_policy_form_link.count,
      driver_policy_underwriting_link.count,
      driver_tiering_info_link.count,
      driver_vehicle_link.count,
      eagle_eye_transmission.count,
      earsimport_data.count,
      eftaccount_default_lookup.count,
      eftaccount_image.count,
      eftaccount_image_pre_note.count,
      eftaccount_policy_link.count,
      elios_auto.count,
      elios_home.count,
      elios_process.count,
      email.count,
      email_queue.count,
      employment.count,
      employment_address_link.count,
      employment_name_link.count,
      employment_phone_link.count,
      eopexposures_coverage.count,
      eopexposures_non_coverage.count,
      eopmonthly_exposures_coverage.count,
      eopmonthly_exposures_non_coverage.count,
      eopmonthly_premiums.count,
      eopmonthly_premiums_non_written.count,
      eopmonthly_tax_premiums.count,
      eoppolicy.count,
      eoppolicy_image.count,
      eoppremiums.count,
      eoppremiums_non_written.count,
      error_log.count,
      error_log_sales_force_detail.count,
      esign_policy_image_link.count,
      excess_limit.count,
      excess_oil_and_gas.count,
      exclusion.count,
      exclusions.count,
      experian_transmission.count,
      experience_modification.count,
      experience_rating.count,
      experience_rating_period.count,
      experience_rating_period_loss_history_link.count,
      extended_properties_policy_image.count,
      fair_credit.count,
      farm_barn_building.count,
      farm_barn_building_additional_interest_link.count,
      farm_barn_building_address_link.count,
      farm_barn_building_classification_code_link.count,
      farm_barn_building_classification_link.count,
      farm_barn_building_coverage_link.count,
      farm_barn_building_glclassification_link.count,
      farm_barn_building_inclusion_exclusion_link.count,
      farm_barn_building_mobile_home_link.count,
      farm_barn_building_modifier_link.count,
      farm_barn_building_optional_coverage.count,
      farm_barn_building_optional_coverage_link.count,
      farm_barn_building_policy_form_link.count,
      farm_barn_building_scheduled_coverage_link.count,
      farm_barn_building_updates_link.count,
      farmers_personal_liability.count,
      farmers_personal_liability_address_link.count,
      farmers_personal_liability_policy_form_link.count,
      farm_incidental_limit_coverage_link.count,
      farm_liability.count,
      farm_structures.count,
      farm_structures_additional_interest_link.count,
      farm_structures_address_link.count,
      farm_structures_coverage_link.count,
      farm_structures_other_structures.count,
      farm_structures_other_structures_coverage.count,
      farm_structures_policy_form_link.count,
      fcrareason.count,
      filing_history.count,
      filing_info.count,
      former_address_link.count,
      fraud_prevention_entity_search_log.count,
      future_events.count,
      geo_tax_info.count,
      geo_tax_info_detail.count,
      geo_tax_transmission.count,
      glclassification.count,
      glclassification_address_link.count,
      glclassification_coverage_link.count,
      glclassification_email_link.count,
      glclassification_name_link.count,
      glclassification_phone_link.count,
      glclassification_scheduled_coverage_link.count,
      home_based_business.count,
      home_based_business_additional_insured_link.count,
      home_based_business_additional_interest_link.count,
      home_based_business_address_link.count,
      home_based_business_ai.count,
      home_based_business_aiaddress_link.count,
      home_based_business_ainame_link.count,
      home_based_business_coverage_link.count,
      home_based_business_liability.count,
      home_based_business_name_link.count,
      home_based_business_property.count,
      home_renewal_check.count,
      household_members.count,
      hurricane_mitigation.count,
      hypothetical_coverage.count,
      iixtransmission.count,
      important_notice.count,
      important_notice_address_link.count,
      important_notice_name_link.count,
      incidental_business_exposure.count,
      incidental_coverages.count,
      incidental_coverages_address_link.count,
      incidental_dwelling_coverage_link.count,
      inclusion_exclusion.count,
      inclusion_exclusion_scheduled_item.count,
      inclusion_exclusion_scheduled_item_address_link.count,
      inclusion_exclusion_scheduled_item_email_link.count,
      inclusion_exclusion_scheduled_item_name_link.count,
      inclusion_exclusion_scheduled_item_phone_link.count,
      inclusion_exclusion_state_link.count,
      increased_limits_special_limits.count,
      increased_personal_prop.count,
      increased_personal_prop_address_link.count,
      increased_special_limits.count,
      inland_marine.count,
      inland_marine_additional_interest_link.count,
      inland_marine_coverage_address_link.count,
      inland_marine_coverage_email_link.count,
      inland_marine_coverage_inclusion_exclusion_link.count,
      inland_marine_coverage_link.count,
      inland_marine_coverage_name_link.count,
      inland_marine_coverage_phone_link.count,
      inland_marine_coverages.count,
      inland_marine_inclusion_exclusion_link.count,
      inland_marine_scheduled_items_link.count,
      inspection.count,
      insurance_score.count,
      insurance_score_name_link.count,
      interface.count,
      interface_process.count,
      interface_xmldata.count,
      irpmcredit.count,
      isotransmission.count,
      landlords_furnishings.count,
      lexis_nexis_transmission.count,
      liability_detail.count,
      liability_detail_item.count,
      location.count,
      location_acreage.count,
      location_acreage_additional_interest_link.count,
      location_additional_insured_link.count,
      location_additional_interest_link.count,
      location_address_link.count,
      location_building_class_information_link.count,
      location_building_information_link.count,
      location_classification_code_link.count,
      location_classification_link.count,
      location_cost_estimate.count,
      location_coverage_link.count,
      location_exclusion_link.count,
      location_form_link.count,
      location_glclassification_link.count,
      location_inclusion_exclusion_link.count,
      location_insight_address.count,
      location_insight_address_score.count,
      location_insight_transmission.count,
      location_modifier_link.count,
      location_name_link.count,
      location_operator_link.count,
      location_optional_coverage.count,
      location_optional_coverage_address_link.count,
      location_optional_coverage_link.count,
      location_personal_liability_name_link.count,
      location_police_fire_district_detail.count,
      location_policy_form_link.count,
      location_policy_underwriting_link.count,
      location_resident_name_link.count,
      location_scheduled_coverage_link.count,
      location_scheduled_items_link.count,
      location_underwriting.count,
      location_updates_link.count,
      location_windstorm_coverage.count,
      location_windstorm_coverage_policy_form_link.count,
      loss_history.count,
      loss_history_detail.count,
      loss_of_income.count,
      loss_of_income_coverage_link.count,
      loss_ratio.count,
      mailing_address_link.count,
      manual_review_reason.count,
      mine_subsidence_structure.count,
      miscellaneous_liability.count,
      mobile_home.count,
      modifier.count,
      motor.count,
      motor_coverage_link.count,
      motorcycle.count,
      motorcycle_additional_interest_link.count,
      motorcycle_coverage_link.count,
      motorcycle_form_link.count,
      motorcycle_garage.count,
      motor_cycle_layup.count,
      motorcycle_modifier_link.count,
      motorcycle_policy_form_link.count,
      motorcycle_scheduled_items_link.count,
      motor_modifier_link.count,
      motor_policy_form_link.count,
      multiple_carrier_insurance.count,
      multiple_carrier_insurance_name_link.count,
      multi_policy_discount_policy_link.count,
      name.count,
      named_driver.count,
      next_aircraft_liability_link_number.count,
      next_automobile_liability_link_number.count,
      next_investment_liability_link_number.count,
      next_personal_liability_link_number.count,
      next_professional_liability_link_number.count,
      next_rec_vehicle_auto_liability_link_number.count,
      next_rec_vehicle_home_liability_link_number.count,
      next_watercraft_liability_link_number.count,
      non_bound_reason.count,
      office_professional.count,
      operator.count,
      operator_additional_interest_link.count,
      operator_address_link.count,
      operator_credit_score_link.count,
      operator_email_link.count,
      operator_employment.count,
      operator_employment_address_link.count,
      operator_employment_name_link.count,
      operator_employment_phone_link.count,
      operator_form_link.count,
      operator_loss_history_link.count,
      operator_name_link.count,
      operator_phone_link.count,
      operator_vehicle_link.count,
      optional_coverage_coverage_link.count,
      optional_coverages.count,
      optional_coverages_address_link.count,
      optional_liability.count,
      optional_liability_address_link.count,
      optional_liability_coverage_link.count,
      optional_liability_form_link.count,
      optional_liability_name_link.count,
      optional_liability_policy_form_link.count,
      other_insurance.count,
      other_insured_location.count,
      other_insured_location_address_link.count,
      other_members_household.count,
      other_members_household_name_link.count,
      other_members_household_policy_form_link.count,
      other_policy.count,
      other_structures.count,
      other_structures_additional.count,
      other_structures_additional_interest_link.count,
      other_structures_address_link.count,
      other_structures_coverage_link.count,
      other_structures_credits_and_debits.count,
      other_structures_form_link.count,
      other_structures_increased_limits.count,
      other_structures_increased_limits_coverage_link.count,
      other_structures_policy_form_link.count,
      other_structures_protective_devices.count,
      other_structures_rented.count,
      other_structures_specific.count,
      package_part.count,
      package_part_policy.count,
      payment_processor_payment_audit.count,
      payroll_deduction_account.count,
      peril_premium.count,
      permitted_incidental_occupancies.count,
      permitted_incidental_occupancies_policy_form_link.count,
      personal_auto.count,
      personal_auto_additional_interest_link.count,
      personal_auto_coverage_link.count,
      personal_auto_credit_score_link.count,
      personal_auto_motor_link.count,
      personal_auto_policy_forms_link.count,
      personal_auto_prior_carrier_link.count,
      personal_auto_residence_info_link.count,
      personal_auto_scheduled_items_link.count,
      personal_dwelling_fire.count,
      personal_dwelling_fire_coverage_link.count,
      personal_dwelling_fire_credit_score_link.count,
      personal_dwelling_fire_policy_forms_link.count,
      personal_dwelling_fire_prior_carrier_link.count,
      personal_home.count,
      personal_home_credit_score_link.count,
      personal_home_policy_forms_link.count,
      personal_home_prior_carrier_link.count,
      personal_home_scheduled_items_link.count,
      personal_inland_marine.count,
      personal_inland_marine_policy_forms_link.count,
      personal_inland_marine_prior_carrier_link.count,
      personal_inland_marine_scheduled_items_link.count,
      personal_liability.count,
      personal_liability_address_link.count,
      personal_liability_policy_form_link.count,
      personal_property.count,
      personal_umbrella.count,
      personal_umbrella_additional_interest_link.count,
      personal_umbrella_coverage_link.count,
      personal_umbrella_form_link.count,
      personal_umbrella_policy_forms_link.count,
      personal_umbrella_prior_carrier_link.count,
      personal_umbrella_residence_info_link.count,
      personal_watercraft.count,
      personal_water_craft_coverage_link.count,
      personal_watercraft_form_link.count,
      personal_watercraft_policy_forms_link.count,
      personal_water_craft_prior_carrier_link.count,
      personal_water_craft_residence_info_link.count,
      phone.count,
      phone_driver.count,
      phone_invest_detail.count,
      phone_vehicle.count,
      physical_address_link.count,
      pip.count,
      policy.count,
      policy_agency_flags.count,
      policy_archive.count,
      policy_audit.count,
      policy_automatic_renewal_underwriting.count,
      policy_document.count,
      policy_events.count,
      policy_export_queue.count,
      policy_form.count,
      policy_form_add_info.count,
      policy_form_additional_info.count,
      policy_form_automatic_transaction_info.count,
      policy_form_link.count,
      policy_forms.count,
      policy_image.count,
      policy_image_address_link.count,
      policy_image_agency_fee.count,
      policy_image_agent_review.count,
      policy_image_assessment.count,
      policy_image_attachment_link.count,
      policy_image_detail_fees.count,
      policy_image_dividend.count,
      policy_image_email_link.count,
      policy_image_modifier_link.count,
      policy_image_name_link.count,
      policy_image_override_validation.count,
      policy_image_phone_link.count,
      policy_image_policy_underwriting_link.count,
      policy_image_underwriter_review.count,
      policy_info.count,
      policy_info_coverage_link.count,
      policy_info_form_link.count,
      policy_info_name_link.count,
      policy_info_youthful_operator_link.count,
      policy_level.count,
      policy_level_additional_interest_link.count,
      policy_level_additional_interest_list_link.count,
      policy_level_classification_code_link.count,
      policy_level_coverage_link.count,
      policy_level_credit_score_link.count,
      policy_level_exclusion_link.count,
      policy_level_glclassification_link.count,
      policy_level_inclusion_exclusion_link.count,
      policy_level_loss_history_link.count,
      policy_level_prior_carrier_link.count,
      policy_level_residence_info_link.count,
      policy_level_scheduled_coverage_link.count,
      policy_level_scheduled_items_link.count,
      policy_level_tiering_info_link.count,
      policy_modification.count,
      policy_next_link_number.count,
      policy_notification_sent_history.count,
      policy_prelude_pay_flag_log_link.count,
      policy_print_distribution.count,
      policy_promo.count,
      policy_purge_exemption.count,
      policy_stats_claim_detail.count,
      policy_stats_master.count,
      policy_stats_premium_detail.count,
      policy_stats_unit_detail.count,
      policy_transferred.count,
      policy_underwriting.count,
      prem_fin2_address_link.count,
      prem_fin_address_link.count,
      print_account_invoice_xml.count,
      printed_renewal_forms.count,
      print_location_control.count,
      print_policy_xml.count,
      print_process.count,
      print_process_billing_information.count,
      print_process_important_notice_link.count,
      print_process_questionnaire_link.count,
      print_process_receipt_information.count,
      print_receipt_xml.count,
      print_xml.count,
      print_xmlpackage.count,
      prior_carrier.count,
      prior_carrier_name_link.count,
      problem_policy_account.count,
      professional_liability.count,
      professional_liability_address_link.count,
      professional_liability_coverage_link.count,
      professional_liability_policy_form_link.count,
      property_inspection.count,
      protective_devices.count,
      questionnaire.count,
      questionnaire_policy_form_link.count,
      rate_analysis_results.count,
      rating_comments.count,
      recreational_vehicle.count,
      reinsurance.count,
      reinsurance_facultative_coverage_code_link.count,
      reinsurance_policy.count,
      renewal_exclusions.count,
      renewal_offers.count,
      renewal_queue.count,
      renewal_underwriting_history.count,
      reports_received.count,
      reprint_history.count,
      required_documents.count,
      residence_info.count,
      residence_info_address_link.count,
      residence_info_detail_address_link.count,
      residential_business.count,
      residential_business_additional_interest_link.count,
      residential_business_address_link.count,
      residential_business_coverage_link.count,
      residential_business_policy_form_link.count,
      rifpolicy_link.count,
      rules_log.count,
      rules_override_policy.count,
      rvwatercraft.count,
      rvwatercraft_additional_interest_link.count,
      rvwatercraft_coverage_link.count,
      rvwatercraft_equipment.count,
      rvwatercraft_equipment_coverage_link.count,
      rvwatercraft_inland_marine_link.count,
      rvwatercraft_motor.count,
      rvwatercraft_motor_coverage_link.count,
      rvwatercraft_operator_link.count,
      rvwatercraft_other_owner_name_link.count,
      rvwatercraft_policy_form_link.count,
      rvwatercraft_trailer.count,
      rvwatercraft_trailer_coverage_link.count,
      safe_deposit_box.count,
      safe_deposit_box_address_link.count,
      safe_deposit_box_policy_form_link.count,
      saqimported_driver.count,
      saqimported_vehicle.count,
      scheduled_coverage.count,
      scheduled_coverage_additional_interest_link.count,
      scheduled_coverage_address_link.count,
      scheduled_coverage_coverage_link.count,
      scheduled_farm_personal_property.count,
      scheduled_farm_personal_property_additional_interest_link.count,
      scheduled_farm_personal_property_coverage_link.count,
      scheduled_glass.count,
      scheduled_items.count,
      scheduled_items_additional_interest_link.count,
      scheduled_items_modifier_link.count,
      scheduled_rating.count,
      scheduled_text.count,
      secondary_liability.count,
      secondary_liability_address_link.count,
      secondary_liability_policy_form_link.count,
      section_coverage.count,
      section_coverage_additional_interest_link.count,
      section_coverage_address_link.count,
      section_coverage_coverage_link.count,
      section_coverage_name_link.count,
      section_coverage_policy_form_link.count,
      snow_ball_reason.count,
      specific_structures.count,
      specific_structures_address_link.count,
      specific_structures_coverage_link.count,
      specific_structures_policy_form_link.count,
      statistics_claim_detail.count,
      statistics_master.count,
      statistics_premium_detail.count,
      statistics_unit_detail.count,
      stats_isoexception_detail_premium_export.count,
      stats_isohomeowners_detail_premium_export.count,
      stats_isoother_than_auto_common_premium_export.count,
      student_away_at_school.count,
      student_away_at_school_address_link.count,
      student_away_at_school_email_link.count,
      student_away_at_school_name_link.count,
      student_away_at_school_phone_link.count,
      student_away_at_school_policy_form_link.count,
      student_personal_effects.count,
      sub_coverage.count,
      sub_coverage_add_info.count,
      sub_coverage_add_info_link.count,
      system_email_key.count,
      tax_report_ky.count,
      theft_coverage.count,
      third_party_designee.count,
      third_party_designee_address_link.count,
      third_party_designee_email_link.count,
      third_party_designee_name_link.count,
      third_party_designee_phone_link.count,
      third_party_designee_policy_form_link.count,
      third_party_transmission.count,
      tiering_info.count,
      tmp_coverage.count,
      trailer.count,
      trans_union_transmission.count,
      trust.count,
      trust_address_link.count,
      trustee.count,
      trustee_address_link.count,
      trustee_email_link.count,
      trustee_name_link.count,
      trustee_phone_link.count,
      trust_name_link.count,
      umbrella_questions.count,
      unattached_motor.count,
      un_attached_motor_coverage_link.count,
      unattached_motor_form_link.count,
      unattached_motor_policy_form_link.count,
      underlying_policy.count,
      underlying_policy_modifier_link.count,
      underlying_policy_policy_info_link.count,
      underwriting_exception.count,
      unit_owners_other_structures.count,
      unscheduled_farm_personal_property.count,
      unscheduled_farm_personal_property_coverage_link.count,
      unscheduled_farm_personal_property_exclusion_link.count,
      updates.count,
      upload_process.count,
      v_account_info.count,
      v_active_image_pay_plan.count,
      v_additional_dwelling.count,
      v_additional_insured_email.count,
      v_additional_insured_phone.count,
      v_address.count,
      v_address_udt.count,
      v_adv_search_claim_control.count,
      v_agency_activity.count,
      v_agency_bill_commission.count,
      v_agency_commission_paid_premium.count,
      v_agency_commission_paid_premium_detail.count,
      v_agency_commission_written_premium.count,
      v_agency_info.count,
      v_agency_reimbursement_clue.count,
      v_agency_reimbursement_credit.count,
      v_agency_reimbursement_mvr.count,
      v_agency_reimbursement_photo.count,
      v_aiemail_link.count,
      v_aiphone_link.count,
      validation_log.count,
      v_applicant.count,
      v_applicant2.count,
      v_applicant_inland.count,
      v_billing_account_data.count,
      v_billing_account_detail.count,
      v_billing_account_history.count,
      v_billing_acct_receivable_by_policy.count,
      v_billing_addressee.count,
      v_billing_cash.count,
      v_billing_cash_apname2.count,
      v_billing_cash_detail.count,
      v_billing_cash_mchg_detail.count,
      v_billing_cash_short_detail.count,
      v_billing_cash_short_detail_balance.count,
      v_billing_charge_credit.count,
      v_billing_charge_mchg_detail.count,
      v_billing_current_information.count,
      v_billing_future_cash.count,
      v_billing_future_notice.count,
      v_billing_future_notice_xml.count,
      v_billing_futures.count,
      v_billing_history.count,
      v_billing_installment_detail.count,
      v_billing_invoice_history.count,
      v_billing_mchg_detail.count,
      v_billing_policy_summary.count,
      v_billing_policy_summary_balance.count,
      v_billing_statement.count,
      v_billing_statement_balance.count,
      v_billing_validate_ar.count,
      v_billing_validate_cash_detail.count,
      v_building_additions.count,
      v_c57_adv_search_policy.count,
      v_check_data_return_premium.count,
      v_check_export_proc_data.count,
      v_choice_point_transmission.count,
      v_claimant_types.count,
      v_claim_feature_financials.count,
      v_claim_limit_for_feature.count,
      v_claim_severity.count,
      v_claims_inquiry.count,
      v_claims_inquiry_claim_control.count,
      v_claims_inquiry_claim_feature.count,
      v_claims_inquiry_transactions.count,
      v_claim_tracking_type.count,
      v_claim_transaction_adjust.count,
      v_claim_transaction_adjust2.count,
      v_coverage.count,
      v_coverage_additional_interest.count,
      v_coverage_address.count,
      v_coverage_address_detail.count,
      v_coverage_exposure.count,
      v_credit_score.count,
      v_driver.count,
      v_driver_accident_violation_count.count,
      v_driver_email.count,
      v_driver_employment.count,
      v_driver_extended_non_owned.count,
      v_driver_extended_non_owned_only_active.count,
      v_driver_name.count,
      v_driver_phone.count,
      v_eftaccount_image_pre_note_data.count,
      v_eftaccount_image_pre_note_records_detail.count,
      v_eftaccount_policy.count,
      v_eftrecord_pre_note_detail.count,
      v_eftrecords_return_info.count,
      vehicle.count,
      vehicle_additional_interest_link.count,
      vehicle_address_link.count,
      vehicle_coverage_link.count,
      vehicle_credit_score_link.count,
      vehicle_damage.count,
      vehicle_driver_exclusion.count,
      vehicle_form_link.count,
      vehicle_garage.count,
      vehicle_history_event.count,
      vehicle_history_report.count,
      vehicle_history_report_factor.count,
      vehicle_location_insight_address_score_link.count,
      vehicle_modifier_link.count,
      vehicle_motor_link.count,
      vehicle_non_owned.count,
      vehicle_policy_form_link.count,
      vehicle_policy_underwriting_link.count,
      vehicle_rating_data.count,
      vehicle_scheduled_items_link.count,
      vehicle_symbol.count,
      vehicle_ubicredit.count,
      vehicle_underwriting.count,
      v_email.count,
      v_employment.count,
      v_excess_oil_and_gas.count,
      v_farmers_personal_liability.count,
      v_farm_structures.count,
      v_future_image_pay_plan.count,
      v_home_based_business.count,
      v_home_based_business_ai.count,
      v_home_based_business_liability.count,
      v_home_based_business_property.count,
      v_important_notice.count,
      v_incidental_coverages.count,
      v_increased_limits_special_limits.count,
      v_increased_personal_prop.count,
      v_increased_special_limits.count,
      v_inland_marine.count,
      v_insured_name.count,
      vintelligence_transmission.count,
      violation.count,
      v_landlords_furnishings.count,
      v_load_clue_vehicles.count,
      v_location.count,
      v_location_coverage.count,
      v_location_name.count,
      v_motorcycle.count,
      v_motorcycle_additional_interest_count.count,
      v_motorcycle_garage_count.count,
      v_name.count,
      v_name_udt.count,
      v_oden_ailist.count,
      v_operator.count,
      v_operator_accident_violation_count.count,
      v_optional_coverages.count,
      v_optional_liability.count,
      v_other_insured_location.count,
      v_other_members_household.count,
      v_other_structures.count,
      v_other_structures_additional.count,
      v_other_structures_increased_limits.count,
      v_other_structures_rented.count,
      v_other_structures_specific.count,
      v_permitted_incidental_occupancies.count,
      v_personal_auto_cov_udt.count,
      v_personal_auto_pol_udt.count,
      v_personal_liability.count,
      v_phone.count,
      v_policy.count,
      v_policy_by_client.count,
      v_policy_by_insured.count,
      v_policy_forms.count,
      v_policy_history.count,
      v_policy_history_xml.count,
      v_policy_image.count,
      v_policy_image_abt.count,
      v_policy_image_billing_account_xml.count,
      v_policy_image_xml.count,
      v_policy_info.count,
      v_printing_form_coverages.count,
      v_printing_get_print_header.count,
      v_printing_personal_auto_forms.count,
      v_printing_personal_dwelling_fire_forms.count,
      v_printing_personal_home_forms.count,
      v_printing_personal_inland_marine_forms.count,
      v_printing_personal_umbrella_forms.count,
      v_printing_personal_watercraft_forms.count,
      v_printing_policy_forms_on_dec.count,
      v_printing_form_version_coverage_type.count,
      v_printing_get_key_info.count,
      v_print_process.count,
      v_prior_carrier.count,
      v_professional_liability.count,
      v_renewal_policy.count,
      v_renewal_queue.count,
      v_residential_business.count,
      v_rvwatercraft.count,
      v_safe_deposit_box.count,
      v_scheduled_glass.count,
      v_scheduled_items.count,
      v_secondary_liability.count,
      v_specific_structures.count,
      v_student_personal_effects.count,
      v_territory.count,
      v_theft_coverage.count,
      v_third_party_designee.count,
      v_unit_owners_other_structures.count,
      v_vehicle.count,
      v_vehicle_motorcycle_watercraft_garage.count,
      v_vehicle_additional_interest_count.count,
      v_vehicle_coverage.count,
      v_vehicle_cov_udt.count,
      v_vehicle_garage_address.count,
      v_vehicle_garage_count.count,
      v_vehicle_rating_data.count,
      v_violation.count,
      v_vtree_history.count,
      v_watercraft.count,
      v_watercraft_additional_interest_count.count,
      v_watercraft_garage_address.count,
      v_watercraft_garage_count.count,
      v_workers_compensation_for_residence_employees.count,
      v_write_letter_claim.count,
      v_write_letter_claimant.count,
      v_write_letter_policy.count,
      v_write_letter_policy_name_address.count,
      v_xml_driver.count,
      v_xml_driver_forms.count,
      v_xml_driver_name.count,
      v_xml_farm_structures_other_structures.count,
      v_xml_home_based_business.count,
      v_xml_inland_marine.count,
      v_xml_location.count,
      v_xml_location_coverages.count,
      v_xml_operator_name.count,
      v_xml_personal_auto.count,
      v_xml_personal_auto_coverage.count,
      v_xml_policy_forms.count,
      v_xml_vehicle.count,
      v_xml_vehicle_coverage.count,
      v_xml_vehicle_forms.count,
      v_xmlapplicant_name.count,
      v_xmlcoverages.count,
      v_xmlextended_non_owned.count,
      v_xmllocation.count,
      v_xmllocation_additional_interest.count,
      v_xmlother_members_household.count,
      v_xmlprior_carrier_name.count,
      v_xmlresidence_info_address.count,
      watercraft.count,
      watercraft_additional_interest_link.count,
      watercraft_coverage_link.count,
      watercraft_form_link.count,
      watercraft_garage.count,
      watercraft_modifier_link.count,
      watercraft_motor_link.count,
      watercraft_policy_form_link.count,
      watercraft_policy_underwriting_link.count,
      watercraft_scheduled_items_link.count,
      watercraft_trailer_link.count,
      watercraft_underwriting.count,
      wcreported_policy.count,
      workers_compensation_for_residence_employees.count,
      workflow_deleted_policy_quotes.count,
      workflow_policy.count,
      youthful_operator.count
    ]
  }
}
