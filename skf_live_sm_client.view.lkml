view: skf_live_sm_client {
  sql_table_name: `skf-bq-analytics-hub.mrep_skf.skf_live_sm_client` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: area_id {
    type: string
    sql: ${TABLE}.area_id ;;
  }

  dimension: area_id_c_team {
    type: string
    sql: ${TABLE}.area_id_c_team ;;
  }
  dimension: area_id_e_team {
    type: string
    sql: ${TABLE}.area_id_e_team ;;
  }
  dimension: area_id_h_team {
    type: string
    sql: ${TABLE}.area_id_h_team ;;
  }
  dimension: area_id_hb_team {
    type: string
    sql: ${TABLE}.area_id_hb_team ;;
  }
  dimension: area_id_n_team {
    type: string
    sql: ${TABLE}.area_id_n_team ;;
  }
  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }
  dimension: category_id {
    type: string
    sql: ${TABLE}.category_id ;;
  }
  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }
  dimension: cid {
    type: string
    sql: ${TABLE}.cid ;;
  }
  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }
  dimension: client_old_id {
    type: string
    sql: ${TABLE}.client_old_id ;;
  }
  dimension: clinic {
    type: string
    sql: ${TABLE}.clinic ;;
  }
  dimension: contact_no1 {
    type: number
    sql: ${TABLE}.contact_no1 ;;
  }
  dimension: contact_no2 {
    type: number
    sql: ${TABLE}.contact_no2 ;;
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
  dimension: credit_limit {
    type: number
    sql: ${TABLE}.credit_limit ;;
  }
  dimension: credit_limit_days {
    type: number
    sql: ${TABLE}.credit_limit_days ;;
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
  dimension: depot_belt_name {
    type: string
    sql: ${TABLE}.depot_belt_name ;;
  }
  dimension: depot_id {
    type: string
    sql: ${TABLE}.depot_id ;;
  }
  dimension: depot_name {
    type: string
    sql: ${TABLE}.depot_name ;;
  }
  dimension: district {
    type: string
    sql: ${TABLE}.district ;;
  }
  dimension: district_id {
    type: string
    sql: ${TABLE}.district_id ;;
  }
  dimension_group: dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dob ;;
  }
  dimension: doctor {
    type: string
    sql: ${TABLE}.doctor ;;
  }
  dimension_group: dom {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dom ;;
  }
  dimension: drug_registration_num {
    type: string
    sql: ${TABLE}.drug_registration_num ;;
  }
  dimension: field1 {
    type: string
    sql: ${TABLE}.field1 ;;
  }
  dimension: field2 {
    type: number
    sql: ${TABLE}.field2 ;;
  }
  dimension: hobby {
    type: string
    sql: ${TABLE}.hobby ;;
  }
  dimension: kids_info {
    type: string
    sql: ${TABLE}.kids_info ;;
  }
  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }
  dimension: manager_contact_no {
    type: number
    sql: ${TABLE}.manager_contact_no ;;
  }
  dimension: manager_name {
    type: string
    sql: ${TABLE}.manager_name ;;
  }
  dimension: market_id {
    type: string
    sql: ${TABLE}.market_id ;;
  }
  dimension: market_name {
    type: string
    sql: ${TABLE}.market_name ;;
  }
  dimension: monthly_sales {
    type: number
    sql: ${TABLE}.monthly_sales ;;
  }
  dimension: monthly_sales_capacity {
    type: number
    sql: ${TABLE}.monthly_sales_capacity ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: nid {
    type: number
    value_format_name: id
    sql: ${TABLE}.nid ;;
  }
  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }
  dimension: op_balance {
    type: number
    sql: ${TABLE}.op_balance ;;
  }
  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }
  dimension: passport {
    type: string
    sql: ${TABLE}.passport ;;
  }
  dimension: photo {
    type: string
    sql: ${TABLE}.photo ;;
  }
  dimension: photo_str {
    type: string
    sql: ${TABLE}.photo_str ;;
  }
  dimension: shop_front_size {
    type: number
    sql: ${TABLE}.shop_front_size ;;
  }
  dimension: shop_owner_status {
    type: string
    sql: ${TABLE}.shop_owner_status ;;
  }
  dimension: shop_size {
    type: number
    sql: ${TABLE}.shop_size ;;
  }
  dimension: starting_year {
    type: number
    sql: ${TABLE}.starting_year ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }
  dimension: sub_category_id {
    type: string
    sql: ${TABLE}.sub_category_id ;;
  }
  dimension: sub_category_name {
    type: string
    sql: ${TABLE}.sub_category_name ;;
  }
  dimension: survey {
    type: string
    sql: ${TABLE}.survey ;;
  }
  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }
  dimension: thana {
    type: string
    sql: ${TABLE}.thana ;;
  }
  dimension: thana_id {
    type: string
    sql: ${TABLE}.thana_id ;;
  }
  dimension: trade_license {
    type: string
    sql: ${TABLE}.trade_license ;;
  }
  dimension: trade_license_no {
    type: string
    sql: ${TABLE}.trade_license_no ;;
  }
  dimension: transit_days {
    type: number
    sql: ${TABLE}.transit_days ;;
  }
  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updated_on ;;
  }
  dimension: vat_registration {
    type: string
    sql: ${TABLE}.vat_registration ;;
  }
  dimension: vat_registration_no {
    type: string
    sql: ${TABLE}.vat_registration_no ;;
  }
  dimension: warehouse_capacity {
    type: number
    sql: ${TABLE}.warehouse_capacity ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  category_name,
  depot_belt_name,
  sub_category_name,
  owner_name,
  market_name,
  name,
  depot_name,
  store_name,
  manager_name
  ]
  }

}
