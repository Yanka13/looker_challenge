# The name of this view in Looker is "Dq Ingestion Runs"
view: dq_ingestion_runs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.dq_ingestion_runs` ;;
  drill_fields: [batch_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: batch_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.batch_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Rows Loaded" in Explore.

  dimension: rows_loaded {
    type: number
    sql: ${TABLE}.rows_loaded ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: run_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.run_end ;;
  }

  dimension_group: run_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.run_start ;;
  }

  dimension: source_table {
    type: string
    sql: ${TABLE}.source_table ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
    drill_fields: [batch_id]
  }
}
