
view: rfieldforce_target_1 {
  derived_table: {
    sql: select (row_number()over()) as IDEN,* from `mrep_skf.rfieldforce_target_1` where YEARMONTH>='2024-01-01' ;;
  }

  dimension: iden {
    type: number
    primary_key: yes
    sql: ${TABLE}.IDEN ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: msoid {
    type: number
    sql: ${TABLE}.MSOID ;;
  }

  dimension: msoname {
    type: string
    sql: ${TABLE}.MSONAME ;;
  }

  dimension: msotr {
    type: string
    sql: ${TABLE}.MSOTR ;;
  }

  dimension: msogroup {
    type: string
    sql: ${TABLE}.MSOGROUP ;;
  }

  dimension: ccmsotr {
    type: string
    sql: ${TABLE}.CCMSOTR ;;
  }

  dimension: fmid {
    type: number
    sql: ${TABLE}.FMID ;;
  }

  dimension: fmname {
    type: string
    sql: ${TABLE}.FMNAME ;;
  }

  dimension: fmtr {
    type: string
    sql: ${TABLE}.FMTR ;;
  }

  dimension: rsmid {
    type: number
    sql: ${TABLE}.RSMID ;;
  }

  dimension: rsmname {
    type: string
    sql: ${TABLE}.RSMNAME ;;
  }

  dimension: rsmtr {
    type: string
    sql: ${TABLE}.RSMTR ;;
  }

  dimension: nsmid {
    type: number
    sql: ${TABLE}.NSMID ;;
  }

  dimension: nsmname {
    type: string
    sql: ${TABLE}.NSMNAME ;;
  }

  dimension: dhid {
    type: number
    sql: ${TABLE}.DHID ;;
  }

  dimension: dhname {
    type: string
    sql: ${TABLE}.DHNAME ;;
  }

  dimension: dhcode {
    type: string
    sql: ${TABLE}.DHCODE ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.TEAM ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}.TARGET ;;
  }

  dimension: specialtarget {
    type: number
    sql: ${TABLE}.SPECIALTARGET ;;
  }

  # dimension: yearmonth {
  #   type: date
  #   datatype: date
  #   sql: ${TABLE}.YEARMONTH ;;
  # }

  dimension: status {
    type: number
    sql: ${TABLE}.STATUS ;;
  }
  dimension_group: yearmonth {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.yearmonth ;;
  }

}
