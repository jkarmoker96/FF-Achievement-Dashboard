# view: sales_details {
#   sql_table_name: `skf-bq-analytics-hub.mrep_skf.sales_details` ;;

view: sales_details {
  derived_table: {
    sql: select (row_number()over()) as IDEN,* from `mrep_skf.sales_details` where sales_date>='2024-01-01' ;;
  }

  dimension: IDEN {
    type: number
    primary_key: yes
    sql: ${TABLE}.IDEN  ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category_id {
    type: string
    sql: ${TABLE}.category_id ;;
  }
  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }
  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.date_time ;;
  }
  dimension: fm_tr {
    type: string
    sql: ${TABLE}.fm_tr ;;
  }
  dimension: invnumber {
    type: string
    sql: ${TABLE}.invnumber ;;
  }
  dimension: item_discount {
    type: number
    sql: ${TABLE}.item_discount ;;
  }
  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: item_vat {
    type: number
    sql: ${TABLE}.item_vat ;;
  }
  dimension: mso_tr {
    type: string
    sql: ${TABLE}.mso_tr ;;
  }
  dimension: msoid {
    type: string
    sql: ${TABLE}.msoid ;;
  }
  dimension: payment_mode {
    type: string
    sql: ${TABLE}.payment_mode ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: rh_tr {
    type: string
    sql: ${TABLE}.rh_tr ;;
  }
  dimension: sales_amt {
    type: number
    sql: ${TABLE}.salesAMT ;;
  }
  dimension_group: sales {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_date ;;
  }
  dimension: short_note {
    type: string
    sql: ${TABLE}.short_note ;;
  }
  dimension: trans_type {
    type: number
    sql: ${TABLE}.transType ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updated_on ;;
  }
  dimension: zh_tr {
    type: string
    sql: ${TABLE}.zh_tr ;;
  }
  dimension: current_month_days {
    type: number
    sql: DATE_DIFF(
          DATE_TRUNC(CURRENT_DATE(), MONTH),
          DATE_TRUNC(DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH), MONTH),
          DAY
        ) ;;
  }
  measure: count {
    type: count
    drill_fields: [item_name, client_name]
  }
  measure: sales_trend_projection {
    type: sum
    sql:
    CASE
      WHEN ${sales_date} >= DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 0 DAY)
           AND ${sales_date} <= CURRENT_DATE()
      THEN (${sales_amt} / EXTRACT(DAY FROM CURRENT_DATE())) * EXTRACT(DAY FROM LAST_DAY(CURRENT_DATE()))
    END;;
    }
  measure: current_mtd_sales {
    type: sum
    sql: CASE
           WHEN ${sales_date} >= DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 0 DAY)
                AND ${sales_date} < DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH),
                INTERVAL EXTRACT(DAY FROM CURRENT_DATE()) - 1 DAY)
           THEN ${sales_amt} END;;
  }
  measure: previous_mtd_sales {
    type: sum
    sql: CASE
         WHEN ${sales_date} >= DATE_ADD(DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH), MONTH), INTERVAL 0 DAY)
              AND ${sales_date} < DATE_ADD(DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH), MONTH),
              INTERVAL EXTRACT(DAY FROM CURRENT_DATE()) - 1 DAY)
         THEN ${sales_amt}
       END;;
  }

}
