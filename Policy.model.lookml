- connection: c00-demo

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: policy
  joins:
     - join: policy_image
       sql_on: ${policy.policy_id} = ${policy_image.policy_id}
       relationship: one_to_many
       
     - join: current_status
       sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id}
       relationship: one_to_one

     - join: trans_reason
       sql_on: ${policy_image.transreason_id} = ${trans_reason.transreason_id}
       relationship: one_to_one

     - join: trans_type
       sql_on: ${policy_image.transtype_id} = ${trans_type.transtype_id}
       relationship: one_to_one

