# The name of this view in Looker is "Supplier Site"
view: supplier_site {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_challenge.supplier_site` ;;
  drill_fields: [supplier_site_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: supplier_site_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.supplier_site_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Country" in Explore.

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_refresh {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_refresh_at ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.site_name ;;
  }

  dimension: supplier_company {
    type: string
    sql: ${TABLE}.supplier_company ;;
  }

  dimension: supplier_group {
    type: string
    sql: ${TABLE}.supplier_group ;;
  }
  measure: count {
    type: count
    drill_fields: [supplier_site_id, site_name, deliveries.count]
  }
}
