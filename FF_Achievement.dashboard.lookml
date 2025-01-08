---
- dashboard: ff_achievement_dashboard
  title: FF Achievement Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: GB991S6ZaTDuqE0CAK1Yte
  elements:
  - title: Sales Target Cr
    name: Sales Target Cr
    model: FF_achievement
    explore: rfieldforce_target_1
    type: single_value
    fields: [sum_of_target]
    filters:
      rfieldforce_target_1.yearmonth_month: this month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Target
      based_on: rfieldforce_target_1.target
      _kind_hint: measure
      measure: sum_of_target
      type: sum
      _type_hint: number
      filters:
        rfieldforce_target_1.yearmonth_month: this month
    - category: table_calculation
      expression: concat(round(${sum_of_target}/10000000,2),"Cr")
      label: Sales Target (Cr.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_target_cr
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    defaults_version: 1
    hidden_fields: [sum_of_target]
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 0
    col: 0
    width: 4
    height: 3
  - title: MTD Sales
    name: MTD Sales
    model: FF_achievement
    explore: rfieldforce_target_1
    type: single_value
    fields: [mtd_sales]
    filters:
      sales_details.sales_month: this month
      rfieldforce_target_1.yearmonth_month: this month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: MTD Sales
      based_on: sales_details.current_mtd_sales
      _kind_hint: measure
      measure: mtd_sales
      type: sum
      _type_hint: number
      filters: {}
    - category: table_calculation
      expression: concat(round(${mtd_sales}/10000000,2),"Cr.")
      label: MTD Sales (Cr.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: mtd_sales_cr
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#12B5CB"
    defaults_version: 1
    hidden_fields: [sum_of_target, mtd_sales]
    hidden_pivots: {}
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 0
    col: 4
    width: 4
    height: 3
  - title: Daily Target
    name: Daily Target
    model: FF_achievement
    explore: rfieldforce_target_1
    type: single_value
    fields: [sum_of_target, sales_details.current_month_days]
    filters:
      rfieldforce_target_1.yearmonth_month: this month
      sales_details.sales_month: this month
    sorts: [sum_of_target desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: rfieldforce_target_1.target
      expression: ''
      label: Sum of Target
      measure: sum_of_target
      type: sum
    - category: table_calculation
      expression: "${sum_of_target}/${sales_details.current_month_days}*(-1)"
      label: SSSS
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: ssss
      _type_hint: number
    - category: table_calculation
      expression: concat(round(${ssss}/10000000,2),"Cr.")
      label: Daily Target
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: daily_target
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#E8710A"
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
    show_null_points: true
    defaults_version: 1
    hidden_fields: [sales_details.current_month_days, sum_of_target, ssss]
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 0
    col: 16
    width: 4
    height: 3
  - title: Achievement
    name: Achievement
    model: FF_achievement
    explore: rfieldforce_target_1
    type: single_value
    fields: [sales_details.current_mtd_sales, sum_of_target]
    filters:
      sales_details.sales_month: this month
      rfieldforce_target_1.yearmonth_month: this month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: rfieldforce_target_1.target
      expression: ''
      label: Sum of Target
      measure: sum_of_target
      type: sum
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}/${sum_of_target}"
      label: Achievement
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achievement
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#E52592"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    hidden_fields: [sales_details.current_mtd_sales, sum_of_target]
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 0
    col: 8
    width: 4
    height: 3
  - title: Chemist Cov
    name: Chemist Cov
    model: FF_achievement
    explore: rfieldforce_target_1
    type: single_value
    fields: [total_chemist, cov_chemist]
    filters:
      sales_details.sales_month: this month
      rfieldforce_target_1.yearmonth_month: this month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Total Chemist
      based_on: sm_client.client_id
      _kind_hint: measure
      measure: total_chemist
      type: count_distinct
      _type_hint: number
    - category: measure
      expression: ''
      label: Cov Chemist
      based_on: sales_details.client_id
      _kind_hint: measure
      measure: cov_chemist
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      expression: "${cov_chemist}/${total_chemist}"
      label: Chemis Cov
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: chemis_cov
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#F9AB00"
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
    defaults_version: 1
    hidden_fields: [total_chemist, cov_chemist]
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 0
    col: 20
    width: 4
    height: 3
  - title: NSM Wise Sales vs Target
    name: NSM Wise Sales vs Target
    model: FF_achievement
    explore: rfieldforce_target_1
    type: table
    fields: [rfieldforce_target_1.nsmname, sum_of_target, sales_details.current_mtd_sales,
      this_month_sales, prev_month_sales, sales_details.sales_trend_projection]
    filters:
      sales_details.sales_month: 2 months
      rfieldforce_target_1.yearmonth_month: this month
    sorts: [sum_of_target desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Target
      based_on: rfieldforce_target_1.target
      _kind_hint: measure
      measure: sum_of_target
      type: sum
      _type_hint: number
      filters:
        rfieldforce_target_1.yearmonth_month: this month
    - category: table_calculation
      expression: concat(round(${sum_of_target}/10000000,2),"Cr.")
      label: Target Cr.
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_cr
      _type_hint: string
    - category: table_calculation
      expression: concat(round(${sales_details.current_mtd_sales}/10000000,2),"Cr.")
      label: Sales Value
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value
      _type_hint: string
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}/${sum_of_target}"
      label: Achievement
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achievement
      _type_hint: number
    - category: measure
      expression: ''
      label: this month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: this_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: this month
    - category: measure
      expression: ''
      label: prev month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: prev_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: last month
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: TREND%
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sales_details.current_mtd_sales, this_month_sales,
      prev_month_sales, sales_details.sales_trend_projection]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 3
    col: 0
    width: 12
    height: 7
  - title: NSM Wise Sales vs Target
    name: NSM Wise Sales vs Target (2)
    model: FF_achievement
    explore: rfieldforce_target_1
    type: looker_bar
    fields: [rfieldforce_target_1.nsmname, sum_of_target, sales_details.current_mtd_sales]
    filters:
      sales_details.sales_month: this month
      rfieldforce_target_1.yearmonth_month: this month
    sorts: [sum_of_target desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: rfieldforce_target_1.target
      expression: ''
      label: Sum of Target
      measure: sum_of_target
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/10000000,2)
      label: Target Cr.
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_cr
      _type_hint: number
    - category: table_calculation
      expression: round(${sales_details.current_mtd_sales}/10000000,2)
      label: Sales Value(Cr.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_valuecr
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: target_cr, id: target_cr,
            name: Target Cr.}, {axisId: sales_value, id: sales_value, name: Sales
              Value}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hide_legend: false
    series_colors: {}
    series_labels:
      sum_of_target: Target
      sales_details.current_mtd_sales: Sales
    hidden_fields: [sales_value, sales_details.current_mtd_sales, sum_of_target]
    hidden_pivots: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 3
    col: 12
    width: 12
    height: 7
  - title: MSO Wise Sales vs Target
    name: MSO Wise Sales vs Target
    model: FF_achievement
    explore: rfieldforce_target_1
    type: table
    fields: [sum_of_target, sales_details.current_mtd_sales, this_month_sales, prev_month_sales,
      mso, sales_details.sales_trend_projection]
    filters:
      sales_details.sales_month: 2 months
      rfieldforce_target_1.yearmonth_month: this month
      rfieldforce_target_1.dhname: ''
    sorts: [sum_of_target desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Target
      based_on: rfieldforce_target_1.target
      _kind_hint: measure
      measure: sum_of_target
      type: sum
      _type_hint: number
      filters:
        rfieldforce_target_1.yearmonth_month: this month
    - category: table_calculation
      expression: concat(round(${sum_of_target}/10000000,2),"Cr.")
      label: Target Cr.
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_cr
      _type_hint: string
    - category: table_calculation
      expression: concat(round(${sales_details.current_mtd_sales}/10000000,2),"Cr.")
      label: Sales Value
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value
      _type_hint: string
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}/${sum_of_target}"
      label: Achievement
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achievement
      _type_hint: number
    - category: measure
      expression: ''
      label: this month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: this_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: this month
    - category: measure
      expression: ''
      label: prev month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: prev_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: last month
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: TREND%
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
    - category: dimension
      expression: concat(${rfieldforce_target_1.msotr},"-",${rfieldforce_target_1.msoname})
      label: MSO
      value_format:
      value_format_name:
      dimension: mso
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sales_details.current_mtd_sales, this_month_sales,
      prev_month_sales, sales_details.sales_trend_projection]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 24
    col: 0
    width: 12
    height: 7
  - title: RH Wise Sales vs Target
    name: RH Wise Sales vs Target
    model: FF_achievement
    explore: rfieldforce_target_1
    type: table
    fields: [sum_of_target, sales_details.current_mtd_sales, this_month_sales, prev_month_sales,
      rh, sales_details.sales_trend_projection]
    filters:
      sales_details.sales_month: 2 months
      rfieldforce_target_1.yearmonth_month: this month
    sorts: [sum_of_target desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Target
      based_on: rfieldforce_target_1.target
      _kind_hint: measure
      measure: sum_of_target
      type: sum
      _type_hint: number
      filters:
        rfieldforce_target_1.yearmonth_month: this month
    - category: table_calculation
      expression: concat(round(${sum_of_target}/10000000,2),"Cr.")
      label: Target Cr.
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_cr
      _type_hint: string
    - category: table_calculation
      expression: concat(round(${sales_details.current_mtd_sales}/10000000,2),"Cr.")
      label: Sales Value
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value
      _type_hint: string
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}/${sum_of_target}"
      label: Achievement
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achievement
      _type_hint: number
    - category: measure
      expression: ''
      label: this month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: this_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: this month
    - category: measure
      expression: ''
      label: prev month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: prev_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: last month
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: TREND%
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
    - category: dimension
      expression: concat(${rfieldforce_target_1.rsmtr},"-",${rfieldforce_target_1.rsmname})
      label: RH
      value_format:
      value_format_name:
      dimension: rh
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sales_details.current_mtd_sales, this_month_sales,
      prev_month_sales, sales_details.sales_trend_projection]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 10
    col: 0
    width: 19
    height: 7
  - title: FM Wise Sales vs Target
    name: FM Wise Sales vs Target
    model: FF_achievement
    explore: rfieldforce_target_1
    type: table
    fields: [sum_of_target, sales_details.current_mtd_sales, this_month_sales, prev_month_sales,
      fm, sales_details.sales_trend_projection]
    filters:
      sales_details.sales_month: 2 months
      rfieldforce_target_1.yearmonth_month: this month
      rfieldforce_target_1.dhname: ''
    sorts: [sum_of_target desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Target
      based_on: rfieldforce_target_1.target
      _kind_hint: measure
      measure: sum_of_target
      type: sum
      _type_hint: number
      filters:
        rfieldforce_target_1.yearmonth_month: this month
    - category: table_calculation
      expression: concat(round(${sum_of_target}/10000000,2),"Cr.")
      label: Target Cr.
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_cr
      _type_hint: string
    - category: table_calculation
      expression: concat(round(${sales_details.current_mtd_sales}/10000000,2),"Cr.")
      label: Sales Value
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value
      _type_hint: string
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}/${sum_of_target}"
      label: Achievement
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achievement
      _type_hint: number
    - category: measure
      expression: ''
      label: this month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: this_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: this month
    - category: measure
      expression: ''
      label: prev month sales
      based_on: sales_details.sales_amt
      _kind_hint: measure
      measure: prev_month_sales
      type: sum
      _type_hint: number
      filters:
        sales_details.sales_date: last month
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: TREND%
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
    - category: dimension
      expression: concat(${rfieldforce_target_1.fmtr},"-",${rfieldforce_target_1.fmname})
      label: FM
      value_format:
      value_format_name:
      dimension: fm
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sales_details.current_mtd_sales, this_month_sales,
      prev_month_sales, sales_details.sales_trend_projection]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      ZH: rfieldforce_target_1.nsmname
      RH: rfieldforce_target_1.rsmtr
      Team: rfieldforce_target_1.team
    row: 17
    col: 0
    width: 12
    height: 7
  - title: Trend %
    name: Trend %
    model: FF_achievement
    explore: rfieldforce_target_1
    type: single_value
    fields: [sales_details.sales_trend_projection, sum_of_target]
    filters:
      sales_details.sales_date: this month
      rfieldforce_target_1.yearmonth_date: this month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: rfieldforce_target_1.target
      expression: ''
      label: Sum of Target
      measure: sum_of_target
      type: sum
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: Trend Per
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: trend_per
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    hidden_fields: [sum_of_target, sales_details.sales_trend_projection]
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
    defaults_version: 1
    listen:
      RH: rfieldforce_target_1.rsmtr
      ZH: rfieldforce_target_1.nsmname
      Team: rfieldforce_target_1.team
    row: 0
    col: 12
    width: 4
    height: 3
  filters:
  - name: Team
    title: Team
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: FF_achievement
    explore: rfieldforce_target_1
    listens_to_filters: []
    field: rfieldforce_target_1.team
  - name: ZH
    title: ZH
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: FF_achievement
    explore: rfieldforce_target_1
    listens_to_filters: [Team]
    field: rfieldforce_target_1.nsmname
  - name: RH
    title: RH
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: FF_achievement
    explore: rfieldforce_target_1
    listens_to_filters: [ZH, Team]
    field: rfieldforce_target_1.rsmtr
