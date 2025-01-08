# The name of this view in Looker is "Process Table Skf"
view: process_table_skf {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `skf-bq-analytics-hub.mrep_skf.process_table_skf` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Batch ID" in Explore.

  dimension: batch_id {
    type: string
    sql: ${TABLE}.batch_id ;;
  }

  dimension: bonus_qty {
    type: number
    sql: ${TABLE}.bonus_qty ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bonus_qty {
    type: sum
    sql: ${bonus_qty} ;;  }
  measure: average_bonus_qty {
    type: average
    sql: ${bonus_qty} ;;  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: depot_id {
    type: string
    sql: ${TABLE}.depot_id ;;
  }

  dimension: depot_name {
    type: string
    sql: ${TABLE}.depot_name ;;
  }

  dimension: fm_id {
    type: string
    sql: ${TABLE}.FM_ID ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: invoice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: invoice_sl {
    type: number
    sql: ${TABLE}.invoice_sl ;;
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: market_name {
    type: string
    sql: ${TABLE}.market_name ;;
  }

  dimension: mso_category {
    type: string
    sql: ${TABLE}.msoCategory ;;
  }

  dimension: mso_id {
    type: string
    sql: ${TABLE}.MSO_ID ;;
  }

  dimension: order_sl {
    type: number
    sql: ${TABLE}.order_sl ;;
  }

  dimension_group: posted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.posted_on ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: rsm_id {
    type: string
    sql: ${TABLE}.RSM_ID ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  dimension: zh_id {
    type: string
    sql: ${TABLE}.ZH_ID ;;
  }
  measure: count {
    type: count
    drill_fields: [item_name, market_name, depot_name, client_name]
  }
}
