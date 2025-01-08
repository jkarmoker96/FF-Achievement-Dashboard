# The name of this view in Looker is "Ff Wise Salse Target"
view: ff_wise_salse_target {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `skf-bq-analytics-hub.view_for_report.ff_wise_salse_target` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: RH {
    type: string
    sql: CONCAT(${TABLE}.RSMTR, "-", ${rsmname});;
  }

  dimension: FM {
    type: string
    sql: CONCAT(${TABLE}.fmtr, "-", ${fmname});;
  }

  dimension: MSO {
    type: string
    sql: CONCAT(${TABLE}.msotr, "-", ${msoname});;
  }

  dimension: dhname {
    type: string
    sql: ${TABLE}.DHNAME ;;
  }

  dimension: fmname {
    type: string
    sql: ${TABLE}.FMNAME ;;
  }

  dimension: fmtr {
    type: string
    sql: ${TABLE}.FMTR ;;
  }

  dimension: msoname {
    type: string
    sql: ${TABLE}.MSONAME ;;
  }

  dimension: msotr {
    type: string
    sql: ${TABLE}.MSOTR ;;
  }

  dimension: mtd_sales {
    type: number
    sql: ${TABLE}.MTD_Sales ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_mtd_sales {
    type: sum
    sql: ${mtd_sales} ;;  }
  measure: average_mtd_sales {
    type: average
    sql: ${mtd_sales} ;;  }

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

  dimension: sales_target {
    type: number
    sql: ${TABLE}.Sales_Target ;;
  }

  dimension: today_sales {
    type: number
    sql: ${TABLE}.Today_Sales ;;
  }

  dimension: yesterday_sales {
    type: number
    sql: ${TABLE}.Yesterday_Sales ;;
  }
  measure: count {
    type: count
    drill_fields: [fmname, dhname, msoname, rsmname, nsmname]
  }
}
