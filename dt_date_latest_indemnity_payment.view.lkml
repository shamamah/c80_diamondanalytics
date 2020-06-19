view: dt_date_latest_indemnity_payment {
  derived_table: {
    sql: SELECT claim_control.claimcontrol_id AS claimcontrol_id
              --SH 2020-06-18 - TT 302617 Added claimant_num and claimfeature_num to join in the model
              ,v_claim_detail_claimant.claimant_num as claimant_num
              ,v_claim_detail_feature.claimfeature_num as claimfeature_num
              ,max(v_claim_detail_transaction.check_date) as max_check_date

      FROM dbo.ClaimControl  AS claim_control
      INNER JOIN dbo.vClaimDetail_Claimant  AS v_claim_detail_claimant ON claim_control.claimcontrol_id = v_claim_detail_claimant.claimcontrol_id
      LEFT JOIN dbo.vClaimDetail_Feature  AS v_claim_detail_feature ON v_claim_detail_claimant.claimcontrol_id = v_claim_detail_feature.claimcontrol_id
                    AND v_claim_detail_claimant.claimant_num = v_claim_detail_feature.claimant_num

      LEFT JOIN dbo.vClaimDetail_Transaction  AS v_claim_detail_transaction ON v_claim_detail_feature.claimcontrol_id = v_claim_detail_transaction.claimcontrol_id
                    AND v_claim_detail_feature.claimant_num = v_claim_detail_transaction.claimant_num
                    AND v_claim_detail_feature.claimfeature_num = v_claim_detail_transaction.claimfeature_num

      LEFT JOIN dbo.ClaimTransactionCategory  AS claim_transaction_category ON v_claim_detail_transaction.claimtransactioncategory_id = claim_transaction_category.claimtransactioncategory_id
      INNER JOIN dbo.CheckStatus  AS check_status ON v_claim_detail_transaction.checkstatus_id = check_status.checkstatus_id

      WHERE claim_transaction_category.dscr = 'Loss Payment'
        and v_claim_detail_transaction.check_number between 1 and 99999999
        and check_status.[description] <> 'Void'
      GROUP BY claim_control.claimcontrol_id
              ,v_claim_detail_claimant.claimant_num
              ,v_claim_detail_feature.claimfeature_num
 ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimfeature_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension_group: max_check_date {
    label: "Date of Latest Indemnity Payment"
    type: time
    timeframes: [date]
    sql: ${TABLE}.max_check_date ;;
  }

}
