- dashboard: claims_operational_test
  title: Claims Operational Dashboard - Test
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 15 minutes
  elements:
  - name: Count of Open Claims
    title: Count of Open Claims
    model: claims_test
    explore: claim_control
    type: single_value
    fields: [claim_control.count]
    filters:
      claim_control_status.dscr: Open
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Open Claims
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 0
    col: 0
    width: 2
    height: 2
  - name: Count of Open CAT Claims
    title: Count of Open CAT Claims
    model: claims_prod
    explore: claim_control
    type: single_value
    fields: [claim_control.count]
    filters:
      claim_control_status.dscr: Open
      claim_catastrophe.user_code: "-EMPTY"
      claim_control.claim_type_id: 'No'
    sorts: [claim_control.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#22678b"
    show_single_value_title: true
    single_value_title: Open CAT Claims
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 0
    col: 2
    width: 2
    height: 2
  - name: Reported Today
    title: Reported Today
    model: claims_prod
    explore: claim_control
    type: single_value
    fields: [claim_control.count]
    filters:
      claim_control.reported_date_date: 1 days
    sorts: [claim_control.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    listen: {}
    row: 0
    col: 4
    width: 2
    height: 2
  - name: Represented Ratio
    title: Represented Ratio
    model: claims_prod
    explore: claim_control
    type: single_value
    fields: [v_claim_detail_claimant.litigated_represented_count, v_claim_detail_claimant.count]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: represented_ratio, label: Represented Ratio,
        expression: "${v_claim_detail_claimant.litigated_represented_count}/${v_claim_detail_claimant.count}",
        value_format: !!null '', value_format_name: decimal_4, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Represented
    value_format: 0.0%
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [v_claim_detail_claimant.litigated_represented_count, v_claim_detail_claimant.count]
    series_types: {}
    listen: {}
    row: 0
    col: 6
    width: 2
    height: 2
  - name: Reopen Ratio
    title: Reopen Ratio
    model: claims_prod
    explore: claim_control
    type: single_value
    fields: [dt_reopen_count.reopen_ratio]
    sorts: [dt_reopen_count.reopen_ratio desc]
    limit: 500
    column_limit: 50
    series_types: {}
    listen: {}
    row: 0
    col: 16
    width: 2
    height: 2
  - name: Close Ratio
    title: Close Ratio
    model: claims_prod
    explore: claim_control
    type: single_value
    fields: [dt_claims_first_activity.first_close_count, dt_claims_first_activity.first_open_count]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: close_ratio, label: close_ratio, expression: "${dt_claims_first_activity.first_close_count}/${dt_claims_first_activity.first_open_count}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Close Ratio
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [dt_claims_first_activity.first_open_count, dt_claims_first_activity.first_close_count]
    series_types: {}
    listen: {}
    row: 0
    col: 18
    width: 2
    height: 2
  - name: Count of Checks Pending Export
    title: Count of Checks Pending Export
    model: claims_prod
    explore: claim_control
    type: single_value
    fields: [v_claim_detail_transaction.count]
    filters:
      check_status.description: Assigned
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Pending Checks
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 0
    col: 20
    width: 2
    height: 2
  - name: Count of Issued Checks Today
    title: Count of Issued Checks Today
    model: claims_prod
    explore: claim_control
    type: single_value
    fields: [v_claim_detail_transaction.count]
    filters:
      v_claim_detail_transaction.check_date_date: 1 days
      check_status.description: Posted
    sorts: [v_claim_detail_transaction.count desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Issued Checks (Today)
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 0
    col: 22
    width: 2
    height: 2
  - name: Claim Volume Over Time
    title: Claim Volume Over Time
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [claim_catastrophe.user_code, claim_control_activity.claim_open_Date_month,
      claim_control.count]
    pivots: [claim_catastrophe.user_code]
    fill_fields: [claim_control_activity.claim_open_Date_month]
    sorts: [claim_control_activity.claim_open_Date_month desc, claim_catastrophe.user_code]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      " - claim_control.count": Not CAT
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: " - claim_control.count",
            name: Claim Claim Count, axisId: claim_control.count}, {id: 1743 - claim_control.count,
            name: '1743', axisId: claim_control.count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 2
    col: 0
    width: 8
    height: 6
  - name: Claim Count by Peril
    title: Claim Count by Peril
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [claim_loss_type.dscr, claim_control.count]
    sorts: [claim_control.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: claim_control.count, name: Claim
              Count, axisId: claim_control.count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_datetime_label: ''
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - name: Closed Volume by Close Duration Tiers (12-months)
    title: Closed Volume by Close Duration Tiers (12-months)
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [dt_claims_first_activity.closed_within, dt_claims_first_activity.first_close_count,
      dt_claims_first_activity.first_close_date_month]
    pivots: [dt_claims_first_activity.closed_within]
    fill_fields: [dt_claims_first_activity.first_close_date_month, dt_claims_first_activity.closed_within]
    filters:
      dt_claims_first_activity.first_close_date_month: 12 months
    sorts: [dt_claims_first_activity.closed_within, dt_claims_first_activity.first_close_date_month]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    trellis: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      91 or Above - 3 - dt_claims_first_activity.first_close_count: "#db7f2a"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: Below 31 - 0 - dt_claims_first_activity.first_close_count,
            name: Below 31, axisId: Below 31 - 0 - dt_claims_first_activity.first_close_count},
          {id: 31 to 60 - 1 - dt_claims_first_activity.first_close_count, name: 31
              to 60, axisId: 31 to 60 - 1 - dt_claims_first_activity.first_close_count},
          {id: 61 to 90 - 2 - dt_claims_first_activity.first_close_count, name: 61
              to 90, axisId: 61 to 90 - 2 - dt_claims_first_activity.first_close_count},
          {id: 91 or Above - 3 - dt_claims_first_activity.first_close_count, name: 91
              or Above, axisId: 91 or Above - 3 - dt_claims_first_activity.first_close_count}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0.3
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 8
    col: 0
    width: 8
    height: 6
  - name: Claims by State Over Time
    title: Claims by State Over Time
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [claim_control.count, company_state_lob.state, dt_claims_first_activity.first_open_date_month]
    pivots: [company_state_lob.state]
    fill_fields: [dt_claims_first_activity.first_open_date_month]
    sorts: [company_state_lob.state 0, dt_claims_first_activity.first_open_date_month]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_labels: {}
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 14
    col: 0
    width: 8
    height: 5
  - name: Claim Volume by Year
    title: Claim Volume by Year
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [claim_control.count, claim_control.reported_date_year]
    fill_fields: [claim_control.reported_date_year]
    sorts: [claim_control.reported_date_year desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: claim_control.count, name: Claim
              Claim Count, axisId: claim_control.count}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: 20%y
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 19
    col: 0
    width: 8
    height: 4
  - name: Open Claims - Days Open
    title: Open Claims - Days Open
    model: claims_prod
    explore: claim_control
    type: looker_pie
    fields: [claim_control.count, dt_claims_first_activity.days_open_tier]
    fill_fields: [dt_claims_first_activity.days_open_tier]
    filters:
      claim_control_status.dscr: Open
      dt_reopen_count.reopen_count: '0'
    sorts: [dt_claim_days_open.days_open_tier]
    limit: 500
    column_limit: 50
    series_types: {}
    listen: {}
    row: 18
    col: 8
    width: 4
    height: 5
  - name: Open Claims by Examiner
    title: Open Claims by Examiner
    model: claims_prod
    explore: claim_control
    type: looker_bar
    fields: [claim_control.count, dt_claim_inside_adjuster.adjuster_name]
    filters:
      claim_control_status.dscr: Open
    sorts: [claim_control.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: claim_control.count, name: Claim
              Count, axisId: claim_control.count}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 12
    col: 8
    width: 8
    height: 6
  - name: Closed Claims - Days to Close
    title: Closed Claims - Days to Close
    model: claims_prod
    explore: claim_control
    type: looker_pie
    fields: [claim_control.count, dt_claims_first_activity.closed_within]
    fill_fields: [dt_claims_first_activity.closed_within]
    filters:
      claim_control_status.dscr: Closed
    sorts: [dt_claims_first_activity.closed_within]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 18
    col: 12
    width: 4
    height: 5
  - name: Assigned vs Closed Ratio by Active Examiners
    title: Assigned vs Closed Ratio by Active Examiners
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [dt_claim_inside_adjuster.adjuster_name, dt_claims_first_activity.first_open_count,
      dt_claims_first_activity.first_close_count]
    filters:
      dt_claim_inside_adjuster.active: "-No"
    sorts: [dt_claims_first_activity.first_open_count desc]
    limit: 500
    dynamic_fields: [{table_calculation: close_ratio, label: Close Ratio, expression: " ${dt_claims_first_activity.first_close_count}/${dt_claims_first_activity.first_open_count}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: true
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      dt_claims_first_activity.first_open_count: "# of Claims Assigned"
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: dt_claims_first_activity.first_open_count,
            name: "# of Claims Assigned", axisId: dt_claims_first_activity.first_open_count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}, {label: !!null '', orientation: right, series: [{id: close_ratio,
            name: Close Ratio, axisId: close_ratio}], showLabels: true, showValues: true,
        maxValue: 1, minValue: 0, unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [dt_claims_first_activity.first_close_count]
    listen: {}
    row: 6
    col: 8
    width: 8
    height: 6
  - name: Loss Paid Percent by Peril
    title: Loss Paid Percent by Peril
    model: claims_prod
    explore: claim_control
    type: looker_pie
    fields: [claim_loss_type.dscr, v_claim_detail_feature.sum_indemnity_paid, v_claim_detail_feature.percent_indemnity_paid,
      claim_control.count]
    filters:
      claim_control_status.dscr: Closed
      v_claim_detail_feature.sum_indemnity_paid: ">0"
    sorts: [v_claim_detail_feature.percent_indemnity_paid desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      v_claim_detail_feature.sum_indemnity_paid: Loss Paid $
      v_claim_detail_feature.percent_indemnity_paid: Loss Paid %
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: v_claim_detail_feature.sum_indemnity_paid,
            name: Loss Paid $, axisId: v_claim_detail_feature.sum_indemnity_paid}],
        showLabels: false, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{id: v_claim_detail_feature.percent_indemnity_paid,
            name: Loss Paid %, axisId: v_claim_detail_feature.percent_indemnity_paid}],
        showLabels: false, showValues: true, maxValue: 100, minValue: 0, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: [claim_control.count, v_claim_detail_feature.sum_indemnity_paid]
    listen: {}
    row: 2
    col: 16
    width: 8
    height: 6
  - name: Average Paid by Peril on Closed Claims
    title: Average Paid by Peril on Closed Claims
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [claim_loss_type.dscr, v_claim_detail_feature.sum_indemnity_paid, v_claim_detail_feature.sum_expense_paid,
      claim_control.count, claim_control.count_with_indemnity_paid, claim_control.count_with_expense_paid,
      dt_summarized_claim_level_financials.ave_loss_paid, dt_summarized_claim_level_financials.ave_expense_paid]
    filters:
      claim_control_status.dscr: Closed
      v_claim_detail_feature.sum_indemnity_paid: ">0"
      company_state_lob.commercial_name1: ''
      claim_control.reported_date_date: 12 months
      company_state_lob.lobname: Homeowners
    sorts: [claim_control.count_with_indemnity_paid desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: average_indemnity_paid, label: Average Indemnity
          Paid, expression: "${v_claim_detail_feature.sum_indemnity_paid}/${claim_control.count_with_indemnity_paid}",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: average_expense_paid, label: Average Expense Paid, expression: "${v_claim_detail_feature.sum_expense_paid}/${claim_control.count_with_expense_paid}",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: !!null '', orientation: left, series: [{id: claim_control.count,
            name: Claim Count, axisId: claim_control.count}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{id: dt_summarized_claim_level_financials.ave_loss_paid,
            name: Average Loss Paid, axisId: dt_summarized_claim_level_financials.ave_loss_paid},
          {id: dt_summarized_claim_level_financials.ave_expense_paid, name: Average
              AO Paid, axisId: dt_summarized_claim_level_financials.ave_expense_paid}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: lab
    hidden_fields: [v_claim_detail_feature.sum_indemnity_paid, v_claim_detail_feature.sum_expense_paid,
      claim_control.count_with_no_indemnity_paid, claim_control.count_with_no_expense_paid,
      claim_control.count_with_indemnity_paid, claim_control.count_with_expense_paid,
      average_indemnity_paid, average_expense_paid]
    listen: {}
    row: 8
    col: 16
    width: 8
    height: 5
  - name: Top 10 Agencies by Loss Paid of Closed Claims
    title: Top 10 Agencies by Loss Paid of Closed Claims
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [dt_policy_agency.agency_name, claim_control.count, v_claim_detail_feature.sum_indemnity_paid]
    filters:
      claim_control_status.dscr: Closed
    sorts: [v_claim_detail_feature.sum_indemnity_paid desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes: [{label: '', orientation: left, series: [{id: claim_control.count, name: Claim
              Count, axisId: claim_control.count}], showLabels: false, showValues: true,
        minValue: 1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{id: v_claim_detail_feature.sum_indemnity_paid,
            name: Loss Paid, axisId: v_claim_detail_feature.sum_indemnity_paid}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: true
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 13
    col: 16
    width: 8
    height: 5
  - name: Subrogation
    title: Subrogation
    model: claims_prod
    explore: claim_control
    type: looker_column
    fields: [v_claim_detail_feature.sum_subro]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 18
    col: 16
    width: 8
    height: 5
  - title: New Tile
    name: New Tile
    model: claims_prod
    explore: claim_control
    type: looker_pie
    fields: [claim_loss_type.dscr, v_claim_detail_feature.sum_indemnity_paid, v_claim_detail_feature.percent_indemnity_paid,
      claim_control.count]
    filters:
      claim_control_status.dscr: Closed,open
      v_claim_detail_feature.sum_indemnity_paid: ">0"
      company_state_lob.commercial_name1: ''
      claim_control.reported_date_date: 365 days
      company_state_lob.lobname: ''
    sorts: [v_claim_detail_feature.percent_indemnity_paid desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      v_claim_detail_feature.sum_indemnity_paid: Loss Paid $
      v_claim_detail_feature.percent_indemnity_paid: Loss Paid %
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: v_claim_detail_feature.sum_indemnity_paid,
            name: Loss Paid $, axisId: v_claim_detail_feature.sum_indemnity_paid}],
        showLabels: false, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{id: v_claim_detail_feature.percent_indemnity_paid,
            name: Loss Paid %, axisId: v_claim_detail_feature.percent_indemnity_paid}],
        showLabels: false, showValues: true, maxValue: 100, minValue: 0, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: [claim_control.count, v_claim_detail_feature.sum_indemnity_paid]
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: New Tile
    name: New Tile (2)
    model: claims_prod
    explore: claim_control
    type: looker_pie
    fields: [claim_loss_type.dscr, v_claim_detail_feature.sum_indemnity_paid, v_claim_detail_feature.percent_indemnity_paid,
      claim_control.count]
    filters:
      claim_control_status.dscr: Closed,open
      v_claim_detail_feature.sum_indemnity_paid: ">0"
      company_state_lob.commercial_name1: ''
      claim_control.reported_date_date: 365 days
      company_state_lob.lobname: ''
      dt_claim_inside_adjuster.adjuster_name: Chris Blair
    sorts: [v_claim_detail_feature.percent_indemnity_paid desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      v_claim_detail_feature.sum_indemnity_paid: Loss Paid $
      v_claim_detail_feature.percent_indemnity_paid: Loss Paid %
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: v_claim_detail_feature.sum_indemnity_paid,
            name: Loss Paid $, axisId: v_claim_detail_feature.sum_indemnity_paid}],
        showLabels: false, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{id: v_claim_detail_feature.percent_indemnity_paid,
            name: Loss Paid %, axisId: v_claim_detail_feature.percent_indemnity_paid}],
        showLabels: false, showValues: true, maxValue: 100, minValue: 0, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: [claim_control.count, v_claim_detail_feature.sum_indemnity_paid]
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
