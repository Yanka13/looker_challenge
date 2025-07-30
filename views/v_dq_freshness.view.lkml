# The name of this view in Looker is "V Dq Freshness"
view: v_dq_freshness {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.v_dq_freshness` ;;
  drill_fields: [source_table]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: source_table {
    primary_key: yes
    type: string
    sql: ${TABLE}.source_table ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age Hours" in Explore.

  dimension: age_hours {
    type: number
    sql: ${TABLE}.age_hours ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_run_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_run_end ;;
  }

  dimension: rows_loaded_7d {
    type: number
    sql: ${TABLE}.rows_loaded_7d ;;
  }

  dimension: success_rate_7d {
    type: number
    sql: ${TABLE}.success_rate_7d ;;
  }
  measure: count {
    type: count
    drill_fields: [source_table]
  }
}
