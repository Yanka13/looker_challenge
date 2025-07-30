# The name of this view in Looker is "V Dq Pk Violations Vehicle"
view: v_dq_pk_violations_vehicle {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.v_dq_pk_violations_vehicle` ;;
  drill_fields: [vehicle_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: vehicle_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.vehicle_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Dup Count" in Explore.

  dimension: dup_count {
    type: number
    sql: ${TABLE}.dup_count ;;
  }
  measure: count {
    type: count
    drill_fields: [vehicle_id]
  }
}
