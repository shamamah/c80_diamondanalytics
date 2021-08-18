view: dt_days_to_loss_payments {
  derived_table: {
    sql: select v_claim_detail_transaction.claimcontrol_id as "claimcontrol_id"
        ,claim_control.claim_number as "claim_number"
        --SH 2020-06-18 - TT 302617 Added claimant_num and claimfeature_num to join in the model
        ,v_claim_detail_claimant.claimant_num as "claimant_num"
        ,v_claim_detail_feature.claimfeature_num as "claimfeature_num"
        ,CONVERT(VARCHAR(10),claim_control_activity.pcadded_date ,120) AS "claim_open_date"
        ,min(CONVERT(VARCHAR(10),v_claim_detail_transaction.check_date ,120)) AS "earliest_loss_payment_check_date"
        --SH 2020-04-29 Added latest loss payment to calculate median date to last payment, a MCAS requirement
        ,max(CONVERT(VARCHAR(10),v_claim_detail_transaction.check_date ,120)) AS "latest_loss_payment_check_date"
        ,count(v_claim_detail_transaction.claimcontrol_id) as "loss_payment_check_count"
        ,DATEDIFF(day,CONVERT(VARCHAR(10),claim_control_activity.pcadded_date ,120),min(CONVERT(VARCHAR(10),v_claim_detail_transaction.check_date ,120))) as "days_to_first_loss_payment"
        --SH 2020-04-29 Added days to last loss payment to calculate median date to last payment, a MCAS requirement
        ,DATEDIFF(day,CONVERT(VARCHAR(10),claim_control_activity.pcadded_date ,120),max(CONVERT(VARCHAR(10),v_claim_detail_transaction.check_date ,120))) as "days_to_last_loss_payment"

      from ClaimControl claim_control
      INNER JOIN dbo.ClaimControlActivity  AS claim_control_activity ON claim_control.claimcontrol_id = claim_control_activity.claimcontrol_id
              and claim_control_activity.num = 1

      INNER JOIN dbo.vClaimDetail_Claimant  AS v_claim_detail_claimant ON claim_control.claimcontrol_id = v_claim_detail_claimant.claimcontrol_id

      LEFT JOIN dbo.vClaimDetail_Feature  AS v_claim_detail_feature ON v_claim_detail_claimant.claimcontrol_id = v_claim_detail_feature.claimcontrol_id
                    AND v_claim_detail_claimant.claimant_num = v_claim_detail_feature.claimant_num

      LEFT JOIN dbo.vClaimDetail_Transaction  AS v_claim_detail_transaction ON v_claim_detail_feature.claimcontrol_id = v_claim_detail_transaction.claimcontrol_id
                    AND v_claim_detail_feature.claimant_num = v_claim_detail_transaction.claimant_num
                    AND v_claim_detail_feature.claimfeature_num = v_claim_detail_transaction.claimfeature_num

      LEFT JOIN dbo.ClaimTransactionCategory  AS claim_transaction_category ON v_claim_detail_transaction.claimtransactioncategory_id = claim_transaction_category.claimtransactioncategory_id
        INNER JOIN dbo.CheckStatus  AS check_status ON v_claim_detail_transaction.checkstatus_id = check_status.checkstatus_id
        INNER JOIN dbo.PolicyImage  AS policy_image ON claim_control.policy_id = policy_image.policy_id
        INNER JOIN dbo.vVersion  AS version ON policy_image.version_id = version.version_id
        INNER JOIN dbo.vCompanyStateLOB  AS company_state_lob ON version.companystatelob_id = company_state_lob.companystatelob_id


      where claim_transaction_category.claimtransactioncategory_id = 2
        and ISNULL(check_number,'') <> ''
        and (check_status.description <> 'Void' OR check_status.description IS NULL)



      group by v_claim_detail_transaction.claimcontrol_id
        ,claim_control.claim_number
        ,v_claim_detail_claimant.claimant_num
        ,v_claim_detail_feature.claimfeature_num
        ,CONVERT(VARCHAR(10),claim_control_activity.pcadded_date ,120)

      having ISNULL(DATEDIFF(day,CONVERT(VARCHAR(10),claim_control_activity.pcadded_date ,120),min(CONVERT(VARCHAR(10),v_claim_detail_transaction.check_date ,120))),'') <> ''

      --order by claim_control.claim_number
       ;;
  }

  #SH 2021-08-17 Added
  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claim_number {
    hidden: yes
    type: string
    sql: ${TABLE}.claim_number ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: string
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimfeature_num {
    hidden: yes
    type: string
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: claim_open_date {
    hidden: yes
    type: string
    sql: ${TABLE}.claim_open_date ;;
  }

  dimension: earliest_loss_payment_check_date {
    hidden: yes
    type: string
    sql: ${TABLE}.earliest_loss_payment_check_date ;;
  }

  dimension: latest_loss_payment_check_date {
    hidden: yes
    type: string
    sql: ${TABLE}.latest_loss_payment_check_date ;;
  }

  dimension: loss_payment_check_count {
    hidden: yes
    type: number
    sql: ${TABLE}.loss_payment_check_count ;;
  }

  dimension: days_to_first_loss_payment {
    label: "Days to First Loss Payment"
    type: number
    sql: ${TABLE}.days_to_first_loss_payment ;;
    value_format_name: decimal_0
  }

  measure: ave_days_to_first_loss_payment {
    label: "Ave Days to First Loss Payment"
    type: average
    sql: ${days_to_first_loss_payment} ;;
    value_format_name: decimal_1
  }

  dimension: days_to_last_loss_payment {
    hidden: yes
    label: "Days to Last Loss Payment"
    type: number
    sql: ${TABLE}.days_to_last_loss_payment ;;
    value_format_name: decimal_0
  }

  measure: ave_days_to_last_loss_payment {
    label: "Ave Days to Last Loss Payment"
    type: average
    sql: ${days_to_last_loss_payment} ;;
    value_format_name: decimal_1
  }

#   Microsoft SQL does NOT support median
#   measure: med_days_to_last_loss_payment {
#     label: "Median Days to Last Loss Payment"
#     type: median
#     sql: ${days_to_last_loss_payment} ;;
#     value_format_name: decimal_1
#   }

}
