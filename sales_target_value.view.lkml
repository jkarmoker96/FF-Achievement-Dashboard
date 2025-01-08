
view: sales_target_value {
  derived_table: {
    sql: WITH
        SalesData AS (
        SELECT
          MSO_ID,
          msoCategory,
          SUM(Sales) AS Today_Sales,
          0 AS Yesterday_Sales,
          0 AS MTD_Sales,
          0 AS Sales_Target
        FROM
          `mrep_skf.process_table_skf`
        WHERE
          invoice_date = CURRENT_DATE()
        GROUP BY
          MSO_ID,
          msoCategory
      
        UNION ALL
        
        SELECT
          MSO_ID,
          msoCategory,
          0 AS Today_Sales,
          SUM(Sales) AS Yesterday_Sales,
          0 AS MTD_Sales,
          0 AS Sales_Target
        FROM
          `mrep_skf.process_table_skf`
        WHERE
          invoice_date = CURRENT_DATE()-1
        GROUP BY
          MSO_ID,
          msoCategory
        UNION ALL
        SELECT
          MSO_ID,
          msoCategory,
          0 AS Today_Sales,
          0 AS Yesterday_Sales,
          SUM(Sales) AS MTD_Sales,
          0 AS Sales_Target
        FROM
          `mrep_skf.process_table_skf`
        WHERE
          invoice_date >= DATE(EXTRACT(YEAR
            FROM
              CURRENT_DATE()), EXTRACT(MONTH
            FROM
              CURRENT_DATE()), 1)
          AND invoice_date < CURRENT_DATE()
        GROUP BY
          MSO_ID,
          msoCategory
        UNION ALL
        SELECT
          MSOTR AS MSO_ID,
          MSOGROUP AS msoCategory,
          0 AS Today_Sales,
          0 AS Yesterday_Sales,
          0 AS MTD_Sales,
          SUM(`TARGET`) AS Sales_Target
        FROM
          `mrep_skf.rfieldforce_target_1`
        WHERE
          YEARMONTH = DATE_TRUNC(CURRENT_DATE(), MONTH)
          AND STATUS = 1
        GROUP BY
          MSO_ID,
          msoCategory )
      SELECT
        rf.DHNAME AS DHNAME,
        rf.NSMNAME AS NSMNAME,
        rf.RSMNAME AS RSMNAME,
        rf.RSMTR AS RSMTR,
        rf.FMNAME AS FMNAME,
        T.MSO_ID AS MSOTR,
        SUM(T.Today_Sales) AS Today_Sales,
        SUM(T.Yesterday_Sales) AS Yesterday_Sales,
        SUM(T.MTD_Sales) AS MTD_Sales,
        SUM(T.Sales_Target) AS Sales_Target
      FROM
        SalesData T
      LEFT JOIN
        `mrep_skf.rfieldforce_target` rf
      ON
        T.MSO_ID = rf.MSOTR
        AND T.msoCategory = rf.MSOGROUP
      WHERE
        T.msoCategory <> ''
        AND rf.STATUS=1
      GROUP BY
        rf.DHNAME,
        rf.NSMNAME,
        rf.RSMNAME,
        rf.RSMTR,
        rf.FMNAME,
        T.MSO_ID ;;
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
