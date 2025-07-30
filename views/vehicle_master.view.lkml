# The name of this view in Looker is "Vehicle Master"
view: vehicle_master {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.vehicle_master` ;;
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
    # This dimension will be called "Battery Capacity Kwh" in Explore.

  dimension: battery_capacity_kwh {
    type: number
    sql: ${TABLE}.battery_capacity_kwh ;;
  }

  dimension: customer_country {
    type: string
    sql: ${TABLE}.customer_country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_refresh {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_refresh_at ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: plant {
    type: string
    sql: ${TABLE}.plant ;;
  }

  dimension: powertrain {
    type: string
    sql: ${TABLE}.powertrain ;;
  }

  dimension_group: production {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.production_date ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }
  measure: count {
    type: count
    drill_fields: [vehicle_id]
  }
}
