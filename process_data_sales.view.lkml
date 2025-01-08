view: process_data_sales {
  sql_table_name: `skf-bq-analytics-hub.mrep_onc.process_data_sales` ;;

  dimension: a {
    type: number
    sql: ${TABLE}.A ;;
  }
  dimension: b {
    type: number
    sql: ${TABLE}.B ;;
  }
  dimension: c {
    type: number
    sql: ${TABLE}.C ;;
  }
  dimension: e {
    type: number
    sql: ${TABLE}.E ;;
  }
  dimension: fm_tr {
    type: string
    sql: ${TABLE}.fm_tr ;;
  }
  dimension: h {
    type: number
    sql: ${TABLE}.H ;;
  }
  dimension: item_brand {
    type: string
    sql: ${TABLE}.item_brand ;;
  }
  dimension: item_category {
    type: string
    sql: ${TABLE}.item_category ;;
  }
  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: l {
    type: number
    sql: ${TABLE}.L ;;
  }
  dimension: mso_tr {
    type: string
    sql: ${TABLE}.mso_tr ;;
  }
  dimension: rh_tr {
    type: string
    sql: ${TABLE}.rh_tr ;;
  }
  dimension_group: sales {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_date ;;
  }
  dimension: sales_value {
    type: number
    sql: ${TABLE}.sales_value ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updated_on ;;
  }
  dimension: z {
    type: number
    sql: ${TABLE}.Z ;;
  }
  dimension: zh_tr {
    type: string
    sql: ${TABLE}.zh_tr ;;
  }
  measure: count {
    type: count
    drill_fields: [item_name]
  }
}
