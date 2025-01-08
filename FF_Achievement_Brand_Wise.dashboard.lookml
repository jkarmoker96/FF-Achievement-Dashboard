---
- dashboard: ff_achievement_brand_wise
  title: FF Achievement Brand Wise
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_bar_collapsed: true
  preferred_slug: WGM1erYCOai2Y6Q1U9wRkF
  elements:
  - title: Total Target
    name: Total Target
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: single_value
    fields: [sum_of_target]
    filters:
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
      expression: concat(round(${sum_of_target}/10000000,2),"Cr.")
      label: Value in Cr.
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: value_in_cr
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
    hidden_fields: [sum_of_target]
    defaults_version: 1
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 0
    col: 0
    width: 4
    height: 2
  - title: MTD Sales
    name: MTD Sales
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: single_value
    fields: [sales_details.current_mtd_sales]
    filters:
      rfieldforce_target_1.yearmonth_month: this month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: concat(round(${sales_details.current_mtd_sales}/10000000,2),"Cr.")
      label: Sales Value(Cr.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_valuecr
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
    defaults_version: 1
    hidden_fields: [sales_details.current_mtd_sales]
    hidden_pivots: {}
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 0
    col: 4
    width: 4
    height: 2
  - title: Achievement %
    name: Achievement %
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: single_value
    fields: [sales_details.current_mtd_sales, sum_of_target]
    filters:
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
      expression: "${sales_details.current_mtd_sales}/${sum_of_target}"
      label: Achievement %
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
    hidden_fields: [sum_of_target, sales_details.current_mtd_sales]
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 0
    col: 8
    width: 4
    height: 2
  - title: TREND
    name: TREND
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: single_value
    fields: [sales_details.current_mtd_sales, sales_details.sales_trend_projection,
      sum_of_target]
    filters:
      rfieldforce_target_1.yearmonth_month: this month
      sales_details.sales_date: this month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: Trend%
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
    - _kind_hint: measure
      _type_hint: number
      based_on: rfieldforce_target_1.target
      expression: ''
      label: Sum of Target
      measure: sum_of_target
      type: sum
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    conditional_formatting: [{type: equal to, value: 0, background_color: "#1A73E8",
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [sales_details.current_mtd_sales, sales_details.sales_trend_projection,
      sum_of_target]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 0
    col: 12
    width: 4
    height: 2
  - title: NSM Wise Sales vs Achievement
    name: NSM Wise Sales vs Achievement
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: table
    fields: [rfieldforce_target_1.nsmname, sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.previous_mtd_sales, sales_details.sales_trend_projection]
    filters:
      rfieldforce_target_1.yearmonth_month: this month
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
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/100000,2)
      label: Target Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_lac
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/100000,2)
      label: Sales Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_lac
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: Trend%
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.previous_mtd_sales, sales_details.sales_trend_projection]
    defaults_version: 1
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 2
    col: 0
    width: 12
    height: 7
  - title: ACHV % By ZH
    name: ACHV % By ZH
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: looker_column
    fields: [rfieldforce_target_1.nsmname, sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.previous_mtd_sales]
    filters:
      rfieldforce_target_1.yearmonth_date: this month
    sorts: [target_value_cr desc]
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
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/10000000,2)
      label: Target Value (Cr.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_cr
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/10000000,2)
      label: Sales Value (Cr.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_cr
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}-${sales_details.previous_mtd_sales}/${sales_details.previous_mtd_sales}*100"
      label: Trend%
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_colors: {}
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.previous_mtd_sales, trend, achv]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 2
    col: 12
    width: 12
    height: 7
  - title: RH Wise Sales vs Achievement
    name: RH Wise Sales vs Achievement
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: table
    fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales, rh,
      sales_details.sales_trend_projection]
    filters:
      rfieldforce_target_1.yearmonth_month: this month
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
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/100000,2)
      label: Target Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_lac
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/100000,2)
      label: Sales Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_lac
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: Trend%
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.sales_trend_projection]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 9
    col: 0
    width: 12
    height: 7
  - title: ACHV % By RH
    name: ACHV % By RH
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: looker_column
    fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales, sales_details.previous_mtd_sales,
      rh]
    filters:
      rfieldforce_target_1.yearmonth_date: this month
    sorts: [target_value_lac desc]
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
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/100000,2)
      label: Target Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_lac
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/100000,2)
      label: Sales Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_lac
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}-${sales_details.previous_mtd_sales}/${sales_details.previous_mtd_sales}*100"
      label: Trend%
      value_format:
      value_format_name:
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.previous_mtd_sales, trend, achv]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 9
    col: 12
    width: 12
    height: 7
  - title: FM Wise Sales vs Achievement
    name: FM Wise Sales vs Achievement
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: table
    fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales, fm,
      sales_details.sales_trend_projection]
    filters:
      rfieldforce_target_1.yearmonth_month: this month
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
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/100000,2)
      label: Target Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_lac
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/100000,2)
      label: Sales Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_lac
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: Trend%
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.sales_trend_projection]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 16
    col: 0
    width: 12
    height: 7
  - title: MSO Wise Sales vs Achievement
    name: MSO Wise Sales vs Achievement
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: table
    fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales, mso,
      sales_details.sales_trend_projection]
    filters:
      rfieldforce_target_1.yearmonth_date: this month
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
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/100000,2)
      label: Target Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_lac
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/100000,2)
      label: Sales Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_lac
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.sales_trend_projection}/${sum_of_target}"
      label: Trend%
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.sales_trend_projection]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 23
    col: 0
    width: 12
    height: 7
  - title: ACHV % By FM
    name: ACHV % By FM
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: looker_column
    fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales, sales_details.previous_mtd_sales,
      rfieldforce_target_1.fmtr]
    filters:
      rfieldforce_target_1.yearmonth_date: this month
    sorts: [target_value_lac desc]
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
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/100000,2)
      label: Target Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_lac
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/100000,2)
      label: Sales Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_lac
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}-${sales_details.previous_mtd_sales}/${sales_details.previous_mtd_sales}*100"
      label: Trend%
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: trend
      _type_hint: number
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: target_value_lac, id: target_value_lac,
            name: Target Value (Lac.)}, {axisId: sales_value_lac, id: sales_value_lac,
            name: Sales Value (Lac.)}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: FM
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.previous_mtd_sales, trend, achv]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 16
    col: 12
    width: 12
    height: 7
  - title: ACHV % By MSO
    name: ACHV % By MSO
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: looker_column
    fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales, sales_details.previous_mtd_sales,
      rfieldforce_target_1.msotr]
    filters:
      rfieldforce_target_1.yearmonth_date: this month
    sorts: [target_value_lac desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: rfieldforce_target_1.target
      expression: ''
      label: Sum of Target
      measure: sum_of_target
      type: sum
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_target}/100000,2)
      label: Target Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: target_value_lac
      _type_hint: number
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/100000,2)
      label: Sales Value (Lac.)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sales_value_lac
      _type_hint: number
    - category: table_calculation
      expression: "${sum_of_sales_amt}/${sum_of_target}"
      label: ACHV %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: achv
      _type_hint: number
    - category: table_calculation
      expression: "${sales_details.current_mtd_sales}-${sales_details.previous_mtd_sales}/${sales_details.previous_mtd_sales}*100"
      label: Trend%
      value_format:
      value_format_name:
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_fields: [sum_of_target, sum_of_sales_amt, sales_details.current_mtd_sales,
      sales_details.previous_mtd_sales, trend, achv]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      Sales Date: sales_details.sales_date
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 23
    col: 12
    width: 12
    height: 7
  - title: Brand Wise Value
    name: Brand Wise Value
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    type: looker_column
    fields: [sales_details.brand, sum_of_sales_amt]
    filters:
      sales_details.sales_date: this month
      rfieldforce_target_1.yearmonth_date: this month
    sorts: [sum_of_sales_amt desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: sales_details.sales_amt
      expression: ''
      label: Sum of Sales Amt
      measure: sum_of_sales_amt
      type: sum
    - category: table_calculation
      expression: round(${sum_of_sales_amt}/10000000,2)
      label: Value In Crore
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: value_in_crore
      _type_hint: number
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: Amount, orientation: left, series: [{axisId: sum_of_sales_amt,
            id: sum_of_sales_amt, name: Sum of Sales Amt}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    series_colors: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [sum_of_sales_amt]
    listen:
      Nsmname: rfieldforce_target_1.nsmname
      Rsmtr: rfieldforce_target_1.rsmtr
      Dhname: rfieldforce_target_1.dhname
      BRAND: band_wise_gpm.brand
      MM ID: band_wise_gpm.mmid
      GPM: band_wise_gpm.gpmname
      GENERIC: band_wise_gpm.generic
    row: 30
    col: 0
    width: 24
    height: 6
  filters:
  - name: Sales Date
    title: Sales Date
    type: field_filter
    default_value: this month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: []
    field: sales_details.sales_date
  - name: BRAND
    title: BRAND
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: []
    field: band_wise_gpm.brand
  - name: MM ID
    title: MM ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: [BRAND]
    field: band_wise_gpm.mmid
  - name: GPM
    title: GPM
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: [MM ID, BRAND]
    field: band_wise_gpm.gpmname
  - name: GENERIC
    title: GENERIC
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: []
    field: band_wise_gpm.generic
  - name: Dhname
    title: Dhname
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: []
    field: rfieldforce_target_1.dhname
  - name: Nsmname
    title: Nsmname
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: [Dhname]
    field: rfieldforce_target_1.nsmname
  - name: Rsmtr
    title: Rsmtr
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ff_achievement_brand_wise
    explore: rfieldforce_target_1
    listens_to_filters: [Nsmname, Dhname]
    field: rfieldforce_target_1.rsmtr
