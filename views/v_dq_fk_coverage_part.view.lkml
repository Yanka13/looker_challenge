# The name of this view in Looker is "V Dq Fk Coverage Part"
view: v_dq_fk_coverage_part {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.v_dq_fk_coverage_part` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: child_rows {
    type: number
    sql: ${TABLE}.child_rows ;;
  }

  dimension: coverage_pct {
    type: number
    sql: ${TABLE}.coverage_pct ;;
  }

  dimension: relation {
    type: string
    sql: ${TABLE}.relation ;;
  }

  dimension: unmatched_rows {
    type: number
    sql: ${TABLE}.unmatched_rows ;;
  }
  measure: count {
    type: count
  }
}
