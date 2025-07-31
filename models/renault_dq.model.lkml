# Define the database connection to be used for this model.
connection: "bigquery_renault_training"

# include all the views
include: "/views/**/*.view.lkml"

label: "Renault Dq"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: renault_dq_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: renault_dq_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Renault Dq"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: v_dq_completeness_vehicle {
  label: "V Dq Completeness Vehicle"
  group_label: "Renault Dq"
}

explore: v_dq_fk_coverage_site {
  label: "V Dq Fk Coverage Site"
  group_label: "Renault Dq"
}

explore: v_dq_fk_coverage_part {
  label: "V Dq Fk Coverage Part"
  group_label: "Renault Dq"
}

explore: v_dq_pk_violations_vehicle {
  label: "V Dq Pk Violations Vehicle"
  group_label: "Renault Dq"
}

explore: v_dq_freshness {
  label: "V Dq Freshness"
  group_label: "Renault Dq"
}


# ------- Business explores for students -------
explore: business_data {
  from: deliveries
  label: "Business Data (Deliveries + Sites + Parts)"
  group_label: "Renault Dq – Business"

  join: supplier_site {
    relationship: many_to_one
    type: left_outer
    sql_on: ${business_data.supplier_site_id} = ${supplier_site.supplier_site_id} ;;
  }

  join: part {
    relationship: many_to_one
    type: left_outer
    sql_on: ${business_data.part_id} = ${part.part_id} ;;
  }
}

explore: vehicle_master {
  label: "Vehicle Master (Business)"
  group_label: "Renault Dq – Business"
}

# (facultatif) Cache les explores granulaires si tu les as créés
explore: deliveries     { hidden: yes }
explore: supplier_site  { hidden: yes }
explore: part           { hidden: yes }
