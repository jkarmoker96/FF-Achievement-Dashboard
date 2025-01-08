
view: pharma_and_onc {
  derived_table: {
    sql: Select (row_number()over()) as IDEN,* from (SELECT
    sd.brand,
    sd.Amount,
    sd.client_id,
    sd.sales_date AS Sales_date,
    rf.YEARMONTH as YEARMONTH,
    MAX(rf.DHNAME) AS DHNAME,
    MAX(rf.NSMNAME) AS NSMNAME,
    MAX(rf.RSMTR) AS RSMTR,
    MAX(rf.FMTR) AS FMTR,
    MAX(rf.MSOTR) AS MSOTR,
    MAX(rf.MSOGROUP) AS MSOGROUP,
    MAX(rf.TEAM) AS TEAM,
    rf.Sales_Target AS Sales_Target
FROM (
SELECT
    DHNAME,
    NSMNAME,
    RSMTR,
    FMTR,
    MSOTR,
    MSOGROUP,
    TEAM,
    YEARMONTH,
    EXTRACT(MONTH FROM DATE_TRUNC(rf.YEARMONTH, MONTH)) AS month,
    TARGET AS Sales_Target
FROM `mrep_skf.rfieldforce_target_1` AS rf
WHERE YEARMONTH >= '2024-12-01'
  AND STATUS = 1


) rf
LEFT JOIN (
    SELECT
        brand,
        SUM(salesAMT) AS Amount,
        sales_date,
        EXTRACT(MONTH FROM DATE_TRUNC(sales_date, MONTH)) AS month,
        mso_tr,
        category_id,
        client_id,
    FROM `mrep_skf.sales_details`
    WHERE sales_date >= '2024-12-01'
    GROUP BY brand, sales_date, mso_tr, category_id, client_id
) sd
    ON rf.MSOTR = sd.mso_tr AND rf.MSOGROUP = sd.category_id
    and rf.month=sd.month

GROUP BY
    sd.brand,
    sd.client_id,
    sd.sales_date,
    sd.Amount,
    rf.Sales_Target,
    rf.YEARMONTH

UNION ALL

SELECT
    'ONC' as brand,
    sd.Amount,
    sd.client_id,
    sd.sales_date AS Sales_date,
    rf.YEARMONTH as YEARMONTH,
    '' AS DHNAME,
    MAX(rf.ZONENAME) AS NSMNAME,
    MAX(rf.REGIONID) AS RSMTR,
    MAX(rf.AREAID) AS FMTR,
    MAX(rf.TERRITORYID) AS MSOTR,
    MAX(rf.MSOGROUP) AS MSOGROUP,
    'Oncology' AS TEAM,
    rf.Sales_Target AS Sales_Target,
FROM (
    SELECT
        '' as DHNAME,
        ZONENAME,
        REGIONID,
        AREAID,
        TERRITORYID,
        MSOGROUP,
        YEARMONTH,
        EXTRACT(MONTH FROM DATE_TRUNC(YEARMONTH, MONTH)) AS month,
        SalesTarget AS Sales_Target
    FROM `mrep_onc.rfieldforce_target`
    WHERE YEARMONTH >= '2024-12-01' AND STATUS = 1
) rf
LEFT JOIN (
    SELECT
        brand,
        SUM(salesAMT) AS Amount,
        sales_date,
        EXTRACT(MONTH FROM DATE_TRUNC(sales_date, MONTH)) AS month,
        mso_tr,
        category_id,
        client_id
    FROM `mrep_onc.sales_details`
    WHERE sales_date >= '2024-12-01'
    GROUP BY brand, sales_date, mso_tr, category_id, client_id
) sd
    ON rf.TERRITORYID = sd.mso_tr AND rf.MSOGROUP = sd.category_id
    and rf.MONTH=sd.MONTH
GROUP BY
    sd.brand,
    sd.client_id,
    sd.sales_date,
    rf.YEARMONTH,
    sd.Amount,
    rf.Sales_Target
) as T

 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: iden {
    type: number
    sql: ${TABLE}.IDEN ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: sales {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_date ;;
  }

  dimension_group: yearmonth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.YEARMONTH ;;
  }

  dimension: dhname {
    type: string
    sql: ${TABLE}.DHNAME ;;
  }

  dimension: nsmname {
    type: string
    sql: ${TABLE}.NSMNAME ;;
  }

  dimension: rsmtr {
    type: string
    sql: ${TABLE}.RSMTR ;;
  }

  dimension: fmtr {
    type: string
    sql: ${TABLE}.FMTR ;;
  }

  dimension: msotr {
    type: string
    sql: ${TABLE}.MSOTR ;;
  }

  dimension: msogroup {
    type: string
    sql: ${TABLE}.MSOGROUP ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.TEAM ;;
  }

  dimension: sales_target {
    type: number
    sql: ${TABLE}.Sales_Target ;;
  }
  dimension: current_month_days {
    type: number
    sql: DATE_DIFF(
          DATE_TRUNC(CURRENT_DATE(), MONTH),
          DATE_TRUNC(DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH), MONTH),
          DAY
        ) ;;
  }
  # measure: count {
  #   type: count
  #   drill_fields: [item_name, client_name]
  # }
  measure: sales_trend_projection {
    type: sum
    sql:
    CASE
      WHEN ${sales_date} >= DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 0 DAY)
           AND ${sales_date} <= CURRENT_DATE()
      THEN (${amount} / EXTRACT(DAY FROM CURRENT_DATE())) * EXTRACT(DAY FROM LAST_DAY(CURRENT_DATE()))
    END;;
  }
  measure: current_mtd_sales {
    type: sum
    sql: CASE
           WHEN ${sales_date} >= DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 0 DAY)
                AND ${sales_date} < DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH),
                INTERVAL EXTRACT(DAY FROM CURRENT_DATE()) - 1 DAY)
           THEN ${amount} END;;
  }
  measure: previous_mtd_sales {
    type: sum
    sql: CASE
         WHEN ${sales_date} >= DATE_ADD(DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH), MONTH), INTERVAL 0 DAY)
              AND ${sales_date} < DATE_ADD(DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH), MONTH),
              INTERVAL EXTRACT(DAY FROM CURRENT_DATE()) - 1 DAY)
         THEN ${amount}
       END;;
  }

  set: detail {
    fields: [
        iden,
  brand,
  amount,
  client_id,
  dhname,
  nsmname,
  rsmtr,
  fmtr,
  msotr,
  msogroup,
  team,
  sales_target
    ]
  }
}
