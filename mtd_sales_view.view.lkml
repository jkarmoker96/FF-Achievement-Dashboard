
view: mtd_sales_view {
  derived_table: {
    sql: WITH
              SalesData AS (
              SELECT
                mso_tr,
                category_id,
                sum(salesAMT) AS Today_Sales,
                0 AS Yesterday_Sales,
                0 AS MTD_Sales,
                0 AS Sales_Target
              FROM
                `mrep_skf.sales_details`
              WHERE
                sales_date = CURRENT_DATE()
              GROUP BY
                mso_tr,
                category_id
            
              UNION ALL
              
              SELECT
                mso_tr,
                category_id,
                0 AS Today_Sales,
                sum(salesAMT) AS Yesterday_Sales,
                0 AS MTD_Sales,
                0 AS Sales_Target
              FROM
                `mrep_skf.sales_details`
              WHERE
                sales_date = CURRENT_DATE()-1
              GROUP BY
                mso_tr,
                category_id
              UNION ALL
              SELECT
                mso_tr,
                category_id,
                0 AS Today_Sales,
                0 AS Yesterday_Sales,
                sum(salesAMT) AS MTD_Sales,
                0 AS Sales_Target
              FROM
                `mrep_skf.sales_details`
              WHERE
                sales_date >= DATE(EXTRACT(YEAR
                  FROM
                    CURRENT_DATE()), EXTRACT(MONTH
                  FROM
                    CURRENT_DATE()), 1)
                AND sales_date < CURRENT_DATE()
              GROUP BY
                mso_tr,
                category_id
      
              UNION ALL
      
              SELECT
                MSOTR AS mso_tr,
                MSOGROUP AS category_id,
                0 AS Today_Sales,
                0 AS Yesterday_Sales,
                0 AS MTD_Sales,
                SUM(TARGET) AS Sales_Target
              FROM
                `mrep_skf.rfieldforce_target_1`
              WHERE
                YEARMONTH = DATE_TRUNC(CURRENT_DATE(), MONTH)
                AND STATUS = 1
              GROUP BY
                MSOTR,
                MSOGROUP )
            SELECT
              rf.DHNAME AS DHNAME,
              rf.NSMNAME AS NSMNAME,
              rf.RSMNAME AS RSMNAME,
              rf.RSMTR AS RSMTR,
              rf.FMNAME AS FMNAME,
              T.mso_tr AS MSOTR,
              SUM(T.Today_Sales) AS Today_Sales,
              SUM(T.Yesterday_Sales) AS Yesterday_Sales,
              SUM(T.MTD_Sales) AS MTD_Sales,
              SUM(T.Sales_Target) AS Sales_Target
            FROM
              SalesData T
            LEFT JOIN
              `mrep_skf.rfieldforce_target` rf
            ON
              T.mso_tr = rf.MSOTR
              AND T.category_id = rf.MSOGROUP
            WHERE
              T.category_id <> ''
              AND rf.STATUS=1
            GROUP BY
              rf.DHNAME,
              rf.NSMNAME,
              rf.RSMNAME,
              rf.RSMTR,
              rf.FMNAME,
              T.mso_tr ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dhname {
    type: string
    sql: ${TABLE}.DHNAME ;;
  }

  dimension: nsmname {
    type: string
    sql: ${TABLE}.NSMNAME ;;
  }

  dimension: rsmname {
    type: string
    sql: ${TABLE}.RSMNAME ;;
  }

  dimension: rsmtr {
    type: string
    sql: ${TABLE}.RSMTR ;;
  }

  dimension: fmname {
    type: string
    sql: ${TABLE}.FMNAME ;;
  }

  dimension: msotr {
    type: string
    sql: ${TABLE}.MSOTR ;;
  }

  dimension: today_sales {
    type: number
    sql: ${TABLE}.Today_Sales ;;
  }

  dimension: yesterday_sales {
    type: number
    sql: ${TABLE}.Yesterday_Sales ;;
  }

  dimension: mtd_sales {
    type: number
    sql: ${TABLE}.MTD_Sales ;;
  }

  dimension: sales_target {
    type: number
    sql: ${TABLE}.Sales_Target ;;
  }

  set: detail {
    fields: [
        dhname,
	nsmname,
	rsmname,
	rsmtr,
	fmname,
	msotr,
	today_sales,
	yesterday_sales,
	mtd_sales,
	sales_target
    ]
  }
}
