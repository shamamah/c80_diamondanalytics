view: c57_loss_expense_ratio_by_coverage {
  label: "Loss Expense Ratio by Coverage"
  derived_table: {
    sql:
        SELECT   company_name
                ,state_name
                ,lobname
                ,coveragecode_id
                ,caption
                ,totalearnedpremium
                ,totalwrittenpremium
                ,lossreserve
                ,losspaid
                ,salvage
                ,subro
                ,expense_reserve
                ,expense_paid
                ,grossincurred
                ,netincurred
                ,GrossEarnedPremiumLossRatio
                ,NetEarnedPremiumLossRatio
        FROM OPENQUERY([C2MSSQL1], 'EXEC Diamond.rpt.assp_Report_Claims_LossExpenseRatioByCoverage_DateRange @company_id = -1, @state_id = {% parameter state_id %}, @lob_id =-1, @start_month = {% parameter start_month %}, @end_month = {% parameter end_month %}, @start_year = {% parameter start_year %}, @end_year = {% parameter end_year %}, @users_id = -1 WITH RESULT SETS ((
                                             company_name varchar(250)
                                            ,state_name varchar(25)
                                            ,lobname varchar(250)
                                            ,coveragecode_id integer
                                            ,caption varchar(250)
                                            ,totalearnedpremium float
                                            ,totalwrittenpremium float
                                            ,lossreserve float
                                            ,losspaid float
                                            ,salvage float
                                            ,subro float
                                            ,expense_reserve float
                                            ,expense_paid float
                                            ,grossincurred float
                                            ,netincurred float
                                            ,GrossEarnedPremiumLossRatio float
                                            ,NetEarnedPremiumLossRatio float
                                          ))')
       ;;
  }

  dimension: compound_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${company_name}, '  ', ${state_name},'  ',${lobname},'  ', ${coveragecode_id}) ;;
  }

  dimension: company_name {
    label: "Company Name"
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: state_name {
    type: string
    label: "State Name"
    sql: ${TABLE}.state_name ;;
  }

  dimension: lobname {
    type: string
    label: "LOB Name"
    sql: ${TABLE}.lobname ;;
  }

  dimension: coveragecode_id {
    type: number
    hidden: yes
    label: "Coverage Code ID"
    sql: ${TABLE}.coveragecode_id ;;
  }

  dimension: caption {
    type: string
    label: "Coverage Code"
    sql: ${TABLE}.caption ;;
  }

  measure: totalearnedpremium {
    type: sum
    value_format_name: usd
    label: "Total Earned Premium"
    sql: ${TABLE}.totalearnedpremium ;;
  }

  measure: totalwrittenpremium {
    type: sum
    value_format_name: usd
    label: "Total Written Premium"
    sql: ${TABLE}.totalwrittenpremium ;;
  }

  measure: lossreserve {
    type: sum
    value_format_name: usd
    label: "Loss Reserve"
    sql: ${TABLE}.lossreserve ;;
  }

  measure: losspaid {
    type: sum
    value_format_name: usd
    label: "Loss Paid"
    sql: ${TABLE}.losspaid ;;
  }

  measure: salvage {
    type: sum
    value_format_name: usd
    label: "Salvage"
    sql: ${TABLE}.salvage ;;
  }

  measure: subro {
    type: sum
    value_format_name: usd
    label: "Subro"
    sql: ${TABLE}.subro ;;
  }

  measure: expense_reserve {
    type: sum
    value_format_name: usd
    label: "Expense Reserve"
    sql: ${TABLE}.expense_reserve ;;
  }

  measure: expense_paid {
    type: sum
    value_format_name: usd
    label: "Expense Paid"
    sql: ${TABLE}.expense_paid ;;
  }

  measure: grossincurred {
    type: sum
    value_format_name: usd
    label: "Gross Incurred"
    sql: ${TABLE}.grossincurred ;;
  }

  measure: netincurred {
    type: sum
    value_format_name: usd
    label: "Net Incurred"
    sql: ${TABLE}.netincurred ;;
  }

  measure: GrossEarnedPremiumLossRatio {
    type: sum
    label: "Gross Earned Premium Loss Ratio"
    sql: ${TABLE}.GrossEarnedPremiumLossRatio ;;
  }

  measure: NetEarnedPremiumLossRatio {
    type: sum
    label: "Net Earned Premium Loss Ratio"
    sql: ${TABLE}.NetEarnedPremiumLossRatio ;;
  }

  parameter: state_id {
    type: number
    label: "State"
    allowed_value: {
      label: "Illinois"
      value: "15"
    }
    allowed_value: {
      label: "Indiana"
      value: "16"
    }
    allowed_value: {
      label: "Texas"
      value: "44"
    }
  }

  parameter: start_month {
    type: unquoted
    label: "Start Month"
    allowed_value: {
      label: "January"
      value: "1"
    }
    allowed_value: {
      label: "February"
      value: "2"
    }
    allowed_value: {
      label: "March"
      value: "3"
    }
    allowed_value: {
      label: "April"
      value: "4"
    }
    allowed_value: {
      label: "May"
      value: "5"
    }
    allowed_value: {
      label: "June"
      value: "6"
    }
    allowed_value: {
      label: "July"
      value: "7"
    }
    allowed_value: {
      label: "August"
      value: "8"
    }
    allowed_value: {
      label: "September"
      value: "9"
    }
    allowed_value: {
      label: "October"
      value: "10"
    }
    allowed_value: {
      label: "November"
      value: "11"
    }
    allowed_value: {
      label: "December"
      value: "12"
    }
  }

  parameter: end_month {
    type: unquoted
    label: "End Month"
    allowed_value: {
      label: "January"
      value: "1"
    }
    allowed_value: {
      label: "February"
      value: "2"
    }
    allowed_value: {
      label: "March"
      value: "3"
    }
    allowed_value: {
      label: "April"
      value: "4"
    }
    allowed_value: {
      label: "May"
      value: "5"
    }
    allowed_value: {
      label: "June"
      value: "6"
    }
    allowed_value: {
      label: "July"
      value: "7"
    }
    allowed_value: {
      label: "August"
      value: "8"
    }
    allowed_value: {
      label: "September"
      value: "9"
    }
    allowed_value: {
      label: "October"
      value: "10"
    }
    allowed_value: {
      label: "November"
      value: "11"
    }
    allowed_value: {
      label: "December"
      value: "12"
    }
  }

  parameter: start_year {
    type: unquoted
    label: "Start Year"
  }

  parameter: end_year {
    type: unquoted
    label: "End Year"
  }


}
