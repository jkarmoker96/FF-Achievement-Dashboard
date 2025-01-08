connection: "mrep_skf"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: rfieldforce_target_1 {
  join: sales_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${rfieldforce_target_1.msotr}=${sales_details.mso_tr}
    and ${rfieldforce_target_1.msogroup}=${sales_details.category_id};;
    # and ${rfieldforce_target_1.status}=1;;
  }
  join: sm_client {
    type: left_outer
    relationship: one_to_many
    sql_on: ${rfieldforce_target_1.msotr}=${sm_client.area_id};;
    }
    }

explore: rfieldforce_target {
  join: sales_details_onc {
    type: left_outer
    relationship: one_to_many
    sql_on: ${rfieldforce_target.territoryid}=${sales_details_onc.mso_tr}
      and ${rfieldforce_target.msogroup}=${sales_details_onc.category_id};;
    # and ${rfieldforce_target_1.status}=1;;
  }
  join: sm_client_onc {
    type: left_outer
    relationship: one_to_many
    sql_on: ${rfieldforce_target.territoryid}=${sm_client_onc.area_id};;
  }
}
