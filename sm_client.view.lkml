
view: sm_client {
  derived_table: {
    sql: Select *,row_number() over() as ID from (select client_id,area_id from `mrep_skf.skf_live_sm_client`  where status='ACTIVE'
      UNION ALL
      select client_id,area_id_c_team  from `mrep_skf.skf_live_sm_client`  where status='ACTIVE'
      UNION ALL
      select client_id,area_id_e_team  from `mrep_skf.skf_live_sm_client`  where status='ACTIVE'
      UNION ALL
      select client_id,area_id_h_team  from `mrep_skf.skf_live_sm_client`  where status='ACTIVE') as T where t.area_id<>'-' and t.area_id<>'' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: area_id {
    type: string
    sql: ${TABLE}.area_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.ID ;;
  }

  set: detail {
    fields: [
        client_id,
	area_id,
	id
    ]
  }
}
