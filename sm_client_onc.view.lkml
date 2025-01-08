
view: sm_client_onc {
  derived_table: {
    sql: select * from `mrep_onc.skfonc_sm_client` where status='ACTIVE' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: area_id {
    type: string
    sql: ${TABLE}.area_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: op_balance {
    type: number
    sql: ${TABLE}.op_balance ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: credit_limit {
    type: number
    sql: ${TABLE}.credit_limit ;;
  }

  dimension: credit_limit_days {
    type: number
    sql: ${TABLE}.credit_limit_days ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: depot_id {
    type: string
    sql: ${TABLE}.depot_id ;;
  }

  dimension: depot_name {
    type: string
    sql: ${TABLE}.depot_name ;;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }

  dimension: depot_belt_name {
    type: string
    sql: ${TABLE}.depot_belt_name ;;
  }

  dimension: category_id {
    type: string
    sql: ${TABLE}.category_id ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

  dimension: sub_category_id {
    type: string
    sql: ${TABLE}.sub_category_id ;;
  }

  dimension: sub_category_name {
    type: string
    sql: ${TABLE}.sub_category_name ;;
  }

  dimension: market_id {
    type: string
    sql: ${TABLE}.market_id ;;
  }

  dimension: market_name {
    type: string
    sql: ${TABLE}.market_name ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }

  dimension: nid {
    type: number
    sql: ${TABLE}.nid ;;
  }

  dimension: passport {
    type: string
    sql: ${TABLE}.passport ;;
  }

  dimension: trade_license {
    type: string
    sql: ${TABLE}.trade_license ;;
  }

  dimension: trade_license_no {
    type: string
    sql: ${TABLE}.trade_license_no ;;
  }

  dimension: vat_registration {
    type: string
    sql: ${TABLE}.vat_registration ;;
  }

  dimension: vat_registration_no {
    type: string
    sql: ${TABLE}.vat_registration_no ;;
  }

  dimension: drug_registration_num {
    type: string
    sql: ${TABLE}.drug_registration_num ;;
  }

  dimension: doctor {
    type: string
    sql: ${TABLE}.doctor ;;
  }

  dimension: contact_no1 {
    type: number
    sql: ${TABLE}.contact_no1 ;;
  }

  dimension: contact_no2 {
    type: number
    sql: ${TABLE}.contact_no2 ;;
  }

  dimension: dob {
    type: date
    datatype: date
    sql: ${TABLE}.dob ;;
  }

  dimension: dom {
    type: date
    datatype: date
    sql: ${TABLE}.dom ;;
  }

  dimension: kids_info {
    type: string
    sql: ${TABLE}.kids_info ;;
  }

  dimension: hobby {
    type: string
    sql: ${TABLE}.hobby ;;
  }

  dimension: manager_name {
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: manager_contact_no {
    type: number
    sql: ${TABLE}.manager_contact_no ;;
  }

  dimension: starting_year {
    type: number
    sql: ${TABLE}.starting_year ;;
  }

  dimension: monthly_sales_capacity {
    type: number
    sql: ${TABLE}.monthly_sales_capacity ;;
  }

  dimension: monthly_sales {
    type: number
    sql: ${TABLE}.monthly_sales ;;
  }

  dimension: shop_owner_status {
    type: string
    sql: ${TABLE}.shop_owner_status ;;
  }

  dimension: warehouse_capacity {
    type: number
    sql: ${TABLE}.warehouse_capacity ;;
  }

  dimension: shop_size {
    type: number
    sql: ${TABLE}.shop_size ;;
  }

  dimension: shop_front_size {
    type: number
    sql: ${TABLE}.shop_front_size ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.photo ;;
  }

  dimension: photo_str {
    type: string
    sql: ${TABLE}.photo_str ;;
  }

  dimension: thana_id {
    type: string
    sql: ${TABLE}.thana_id ;;
  }

  dimension: thana {
    type: string
    sql: ${TABLE}.thana ;;
  }

  dimension: district_id {
    type: string
    sql: ${TABLE}.district_id ;;
  }

  dimension: district {
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: field1 {
    type: string
    sql: ${TABLE}.field1 ;;
  }

  dimension: field2 {
    type: number
    sql: ${TABLE}.field2 ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension_group: created_on {
    type: time
    datatype: datetime
    sql: ${TABLE}.created_on ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: updated_on {
    type: time
    datatype: datetime
    sql: ${TABLE}.updated_on ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension: datastream_metadata {
    type: string
    sql: ${TABLE}.datastream_metadata ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }
  set: detail {
    fields: [
        id,
	cid,
	client_id,
	client_old_id,
	name,
	area_id,
	status,
	op_balance,
	balance,
	credit_limit,
	credit_limit_days,
	address,
	latitude,
	longitude,
	depot_id,
	depot_name,
	store_id,
	store_name,
	depot_belt_name,
	category_id,
	category_name,
	sub_category_id,
	sub_category_name,
	market_id,
	market_name,
	owner_name,
	nid,
	passport,
	trade_license,
	trade_license_no,
	vat_registration,
	vat_registration_no,
	drug_registration_num,
	doctor,
	contact_no1,
	contact_no2,
	dob,
	dom,
	kids_info,
	hobby,
	manager_name,
	manager_contact_no,
	starting_year,
	monthly_sales_capacity,
	monthly_sales,
	shop_owner_status,
	warehouse_capacity,
	shop_size,
	shop_front_size,
	photo,
	photo_str,
	thana_id,
	thana,
	district_id,
	district,
	field1,
	field2,
	note,
	created_on_time,
	created_by,
	updated_on_time,
	updated_by,
	datastream_metadata,
	location
    ]
  }
}
