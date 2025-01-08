# Define the database connection to be used for this model.
connection: "mrep_skf"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: rsm_wise_live_sales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rsm_wise_live_sales_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Rsm Wise Live Sales"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.
# explore: rfieldforce_target_1
explore: ff_wise_salse_target {
  join: process_table_skf {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ff_wise_salse_target.msotr}=${process_table_skf.mso_id}
    and ${ff_wise_salse_target.category}=${process_table_skf.mso_category} ;;
  }
}
explore: rfieldforce_target_1 {
  join: sales_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${rfieldforce_target_1.msotr}=${sales_details.mso_tr}
    and ${rfieldforce_target_1.msogroup}=${sales_details.category_id}
    and ${rfieldforce_target_1.status}=1;;
  }
}

explore: combined_explore {
  from: ff_wise_salse_target

  join: skf_live_sm_client {
    type: left_outer
    relationship: many_to_many
    sql_on:  ${combined_explore.msotr}= ${skf_live_sm_client.area_id}
      AND ${skf_live_sm_client.status}='ACTIVE' ;;

  }
  join: process_table_skf {
    type: left_outer
    relationship: many_to_many
    sql_on:  ${combined_explore.msotr}= ${process_table_skf.mso_id}
      AND ${combined_explore.category} = ${process_table_skf.mso_category} ;;
  }
  join: sales_details {
    type: left_outer
    relationship: many_to_many
    sql_on: ${combined_explore.msotr}= ${sales_details.mso_tr}
      AND ${combined_explore.category} = ${sales_details.category_id} ;;
  }
  }
