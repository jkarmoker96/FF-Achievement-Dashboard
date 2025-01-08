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
  join: band_wise_gpm {
    type: left_outer
    relationship: one_to_many
    sql_on: UPPER(LTRIM(RTRIM(${sales_details.brand})))=UPPER(LTRIM(RTRIM(${band_wise_gpm.brand})));;
  }}
