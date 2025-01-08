# view: rfieldforce_target {
#   sql_table_name: `skf-bq-analytics-hub.mrep_onc.rfieldforce_target` ;;

view: rfieldforce_target {
    derived_table: {
      sql: select (row_number()over()) as IDEN,* from `skf-bq-analytics-hub.mrep_onc.rfieldforce_target` where YEARMONTH>='2024-01-01' ;;
    }

  dimension: iden {
    type: number
    primary_key: yes
    sql: ${TABLE}.IDEN ;;
  }

  dimension: areaid {
    type: string
    sql: ${TABLE}.AREAID ;;
  }
  dimension: areaname {
    type: string
    sql: ${TABLE}.AREANAME ;;
  }
  dimension: fmid {
    type: string
    sql: ${TABLE}.FMID ;;
  }
  dimension: fmmobile {
    type: string
    sql: ${TABLE}.FMMOBILE ;;
  }
  dimension: fmname {
    type: string
    sql: ${TABLE}.FMNAME ;;
  }
  dimension: msogroup {
    type: string
    sql: ${TABLE}.MSOGROUP ;;
  }
  dimension: msoid {
    type: string
    sql: ${TABLE}.MSOID ;;
  }
  dimension: msomobile {
    type: string
    sql: ${TABLE}.MSOMOBILE ;;
  }
  dimension: msoname {
    type: string
    sql: ${TABLE}.MSONAME ;;
  }
  dimension: nsmid {
    type: string
    sql: ${TABLE}.NSMID ;;
  }
  dimension: nsmmobile {
    type: string
    sql: ${TABLE}.NSMMOBILE ;;
  }
  dimension: nsmname {
    type: string
    sql: ${TABLE}.NSMNAME ;;
  }
  dimension: regionid {
    type: string
    sql: ${TABLE}.REGIONID ;;
  }
  dimension: regionname {
    type: string
    sql: ${TABLE}.REGIONNAME ;;
  }
  dimension: rsmid {
    type: string
    sql: ${TABLE}.RSMID ;;
  }
  dimension: rsmmobile {
    type: string
    sql: ${TABLE}.RSMMOBILE ;;
  }
  dimension: rsmname {
    type: string
    sql: ${TABLE}.RSMNAME ;;
  }
  dimension: rxtarget {
    type: number
    sql: ${TABLE}.RXTarget ;;
  }
  dimension: sales_target {
    type: number
    sql: ${TABLE}.SalesTarget ;;
  }
  dimension: status {
    type: number
    sql: ${TABLE}.STATUS ;;
  }
  dimension: territoryid {
    type: string
    sql: ${TABLE}.TERRITORYID ;;
  }
  dimension: territoryname {
    type: string
    sql: ${TABLE}.TERRITORYNAME ;;
  }
  dimension_group: yearmonth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.YEARMONTH ;;
  }
  dimension: zoneid {
    type: string
    sql: ${TABLE}.ZONEID ;;
  }
  dimension: zonename {
    type: string
    sql: ${TABLE}.ZONENAME ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  fmname,
  territoryname,
  nsmname,
  msoname,
  regionname,
  rsmname,
  zonename,
  areaname
  ]
  }

}
