
view: tr_wise_query {
  derived_table: {
    sql: SELECT
          (row_number()over()) as IDEN,
          dt.item_id,
          dt.item_name,
          SUM(dt.salesAMT) AS Amount,
          SUM(dt.qty) AS QTY,
          ist.price,
          ist.unit_type,
          dt.sales_date as Sales_date,
          MAX(ff.DHNAME) as DHNAME,
          MAX(ff.NSMNAME) AS NSMNAME,
          MAX(ff.RSMTR) AS RSMTR,
          MAX(ff.FMTR) AS FMTR,
          MAX(ff.MSOTR) AS MSOTR,
          MAX(ff.MSOGROUP) AS MSOGROUP,
          MAX(ff.TEAM) as TEAM
      FROM
          (SELECT DISTINCT
              DHNAME,
              NSMNAME,
              RSMTR,
              FMTR,
              MSOTR,
              MSOGROUP,
              TEAM
           FROM mrep_skf.rfieldforce_target_1
           WHERE YEARMONTH >= '2024-12-01' AND STATUS = 1
          ) AS ff
      LEFT JOIN
          mrep_skf.sales_details AS dt
          ON dt.mso_tr = ff.MSOTR 
             AND dt.category_id = ff.MSOGROUP
      LEFT JOIN
          (SELECT
              item_id,
              name,
              price,
              unit_type,
              category_id
           FROM mrep_skf.skf_live_sm_item
          ) AS ist
          ON dt.item_id = ist.item_id
      WHERE
          (ist.category_id IS NULL OR ist.category_id <> 'V') -- Handles NULLs in category_id
          AND (ist.item_id IS NULL OR ist.item_id NOT LIKE '9%') -- Handles NULLs in item_id
          AND  dt.sales_date >= '2024-11-01' -- Handles NULLs in sales_date
      GROUP BY
          dt.item_id,
          dt.item_name,
          ist.price,
          ist.unit_type,
          dt.sales_date ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: iden {
    type: number
    sql: ${TABLE}.IDEN ;;
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.QTY ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: unit_type {
    type: string
    sql: ${TABLE}.unit_type ;;
  }

  dimension: sales_date {
    type: date
    datatype: date
    sql: ${TABLE}.Sales_date ;;
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

  set: detail {
    fields: [
        iden,
	item_id,
	item_name,
	amount,
	qty,
	price,
	unit_type,
	sales_date,
	dhname,
	nsmname,
	rsmtr,
	fmtr,
	msotr,
	msogroup,
	team
    ]
  }
}
