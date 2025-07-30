# The name of this view in Looker is "V Dq Completeness Vehicle"
view: v_dq_completeness_vehicle {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.v_dq_completeness_vehicle` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Column Name" in Explore.

  dimension: column_name {
    type: string
    sql: ${TABLE}.column_name ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: pct_null {
    type: number
    sql: ${TABLE}.pct_null ;;
  }

  dimension: plant {
    type: string
    sql: ${TABLE}.plant ;;
  }
  measure: count {
    type: count
    drill_fields: [column_name]
  }
}
