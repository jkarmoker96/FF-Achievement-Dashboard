
view: band_wise_gpm {
  derived_table: {
    sql: SELECT DISTINCT   (row_number()over()) as IDEN,
                          T.MMID,
                          T.GPMID,
                          T.GPMNAME,
                          T.manufacturer AS BRAND,
                          T.GENERIC
                       FROM (
                          SELECT
                              ITEMNO,
                              MMID,
                              GPMID,
                              GPMNAME,
                              manufacturer,
                              GENERIC
                          FROM `mrep_skf.skf_live_sm_item_setup` AS it
                          INNER JOIN `mrep_skf.skf_live_sm_item` AS i
                          ON it.ITEMNO = i.item_id
                       ) AS T
                       WHERE T.MMID IS NOT NULL OR T.GPMID IS NOT NULL;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: iden {
    type: number
    sql: ${TABLE}.IDEN ;;
  }

  dimension: mmid {
    type: string
    sql: ${TABLE}.MMID ;;
  }

  dimension: gpmid {
    type: string
    sql: ${TABLE}.GPMID ;;
  }

  dimension: gpmname {
    type: string
    sql: ${TABLE}.GPMNAME ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.BRAND ;;
  }

  dimension: generic {
    type: string
    sql: ${TABLE}.GENERIC ;;
  }

  set: detail {
    fields: [
        iden,
  mmid,
  gpmid,
  gpmname,
  brand,
  generic
    ]
  }
}
