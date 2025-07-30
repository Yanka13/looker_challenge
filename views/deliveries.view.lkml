# The name of this view in Looker is "Deliveries"
view: deliveries {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.deliveries` ;;
  drill_fields: [delivery_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: delivery_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.delivery_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Defects" in Explore.

  dimension: defects {
    type: number
    sql: ${TABLE}.defects ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: delivered {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_date ;;
  }

  dimension_group: last_refresh {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_refresh_at ;;
  }

  dimension: part_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.part_id ;;
  }

  dimension_group: planned {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.planned_date ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: supplier_site_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.supplier_site_id ;;
  }
  measure: count {
    type: count
    drill_fields: [delivery_id, supplier_site.site_name, supplier_site.supplier_site_id, part.part_id]
  }
}
