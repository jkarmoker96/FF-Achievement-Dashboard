view: skf_live_sm_item_setup {
  sql_table_name: `skf-bq-analytics-hub.mrep_skf.skf_live_sm_item_setup` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: al {
    type: number
    sql: ${TABLE}.AL ;;
  }
  dimension: alphabetic {
    type: string
    sql: ${TABLE}.ALPHABETIC ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.BRAND ;;
  }
  dimension: cp01 {
    type: string
    sql: ${TABLE}.CP01 ;;
  }
  dimension: cp02 {
    type: string
    sql: ${TABLE}.CP02 ;;
  }
  dimension: cpp {
    type: number
    sql: ${TABLE}.CPP ;;
  }
  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.created_on ;;
  }
  dimension: datastream_metadata__source_timestamp {
    type: number
    sql: ${TABLE}.datastream_metadata.source_timestamp ;;
    group_label: "Datastream Metadata"
    group_item_label: "Source Timestamp"
  }
  dimension: datastream_metadata__uuid {
    type: string
    sql: ${TABLE}.datastream_metadata.uuid ;;
    group_label: "Datastream Metadata"
    group_item_label: "Uuid"
  }
  dimension: des {
    type: string
    sql: ${TABLE}.DES ;;
  }
  dimension: details_code {
    type: string
    sql: ${TABLE}.DETAILS_CODE ;;
  }
  dimension: doges {
    type: string
    sql: ${TABLE}.DOGES ;;
  }
  dimension: dogesunit {
    type: number
    sql: ${TABLE}.DOGESUNIT ;;
  }
  dimension: entrydate {
    type: number
    sql: ${TABLE}.ENTRYDATE ;;
  }
  dimension: exid {
    type: string
    sql: ${TABLE}.EXID ;;
  }
  dimension: fmtitemno {
    type: string
    sql: ${TABLE}.FMTITEMNO ;;
  }
  dimension: generic {
    type: string
    sql: ${TABLE}.GENERIC ;;
  }
  dimension: gpmid {
    type: string
    sql: ${TABLE}.GPMID ;;
  }
  dimension: gpmname {
    type: string
    sql: ${TABLE}.GPMNAME ;;
  }
  dimension: incentivestatus {
    type: number
    sql: ${TABLE}.INCENTIVESTATUS ;;
  }
  dimension: itemname {
    type: string
    sql: ${TABLE}.ITEMNAME ;;
  }
  dimension: itemno {
    type: string
    sql: ${TABLE}.ITEMNO ;;
  }
  dimension: itemstrength {
    type: string
    sql: ${TABLE}.ITEMSTRENGTH ;;
  }
  dimension: mmid {
    type: string
    sql: ${TABLE}.MMID ;;
  }
  dimension: moleculetype {
    type: string
    sql: ${TABLE}.MOLECULETYPE ;;
  }
  dimension: mrp {
    type: number
    sql: ${TABLE}.MRP ;;
  }
  dimension: otherid {
    type: string
    sql: ${TABLE}.OTHERID ;;
  }
  dimension: packsize {
    type: string
    sql: ${TABLE}.PACKSIZE ;;
  }
  dimension: prbasegroup {
    type: string
    sql: ${TABLE}.PRBASEGROUP ;;
  }
  dimension: prescriptionvalue {
    type: string
    sql: ${TABLE}.PRESCRIPTIONVALUE ;;
  }
  dimension: present_month {
    type: string
    sql: ${TABLE}.PRESENT_MONTH ;;
  }
  dimension: present_year {
    type: string
    sql: ${TABLE}.PRESENT_YEAR ;;
  }
  dimension: prgroup {
    type: string
    sql: ${TABLE}.PRGROUP ;;
  }
  dimension: productcode {
    type: number
    sql: ${TABLE}.PRODUCTCODE ;;
  }
  dimension: productsl {
    type: string
    sql: ${TABLE}.PRODUCTSL ;;
  }
  dimension: prteam {
    type: string
    sql: ${TABLE}.PRTEAM ;;
  }
  dimension: remarks {
    type: string
    sql: ${TABLE}.REMARKS ;;
  }
  dimension: sample_cost {
    type: number
    sql: ${TABLE}.SAMPLE_COST ;;
  }
  dimension: samplepack {
    type: string
    sql: ${TABLE}.SAMPLEPACK ;;
  }
  dimension: scode {
    type: string
    sql: ${TABLE}.SCODE ;;
  }
  dimension: segment01 {
    type: string
    sql: ${TABLE}.SEGMENT01 ;;
  }
  dimension: segment02 {
    type: string
    sql: ${TABLE}.SEGMENT02 ;;
  }
  dimension: segment03 {
    type: string
    sql: ${TABLE}.SEGMENT03 ;;
  }
  dimension: segment_accounts {
    type: string
    sql: ${TABLE}.SEGMENT_Accounts ;;
  }
  dimension: status {
    type: number
    sql: ${TABLE}.STATUS ;;
  }
  dimension: status_period {
    type: string
    sql: ${TABLE}.STATUS_PERIOD ;;
  }
  dimension: therapeuticclass {
    type: string
    sql: ${TABLE}.THERAPEUTICCLASS ;;
  }
  dimension: tp_changed {
    type: string
    sql: ${TABLE}.TP_CHANGED ;;
  }
  dimension: tradeprice {
    type: number
    sql: ${TABLE}.TRADEPRICE ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }
  dimension: unit {
    type: string
    sql: ${TABLE}.UNIT ;;
  }
  dimension: unit_price_mrp {
    type: number
    sql: ${TABLE}.UNIT_PRICE_MRP ;;
  }
  dimension: unitprice {
    type: number
    sql: ${TABLE}.UNITPRICE ;;
  }
  measure: count {
    type: count
    drill_fields: [id, gpmname, itemname]
  }
}
