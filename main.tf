locals {
  config     = try(var.config_file != null ? yamldecode(file(var.config_file)) : tomap(false), {}) # https://github.com/hashicorp/terraform/issues/22405#issuecomment-591917758
  query_file = contains(keys(local.config), "query_file") ? join("/", [dirname(var.config_file), local.config.query_file]) : null
  query_vars = lookup(local.config, "query_vars", var.query_vars)
  query      = local.query_file != null ? templatefile(local.query_file, local.query_vars) : lookup(local.config, "query", var.query)
  dataset_id = lookup(local.config, "dataset_id", var.dataset_id)
  table_id   = lookup(local.config, "table_id", var.table_id)
}


resource "google_bigquery_data_transfer_config" "scheduled_query" {
  display_name           = "${local.dataset_id}__${local.table_id}"
  location               = lookup(local.config, "location", var.location)
  data_source_id         = "scheduled_query"
  destination_dataset_id = local.dataset_id
  schedule               = lookup(local.config, "schedule", var.schedule)
  params = {
    destination_table_name_template = local.table_id
    write_disposition               = lookup(local.config, "write_disposition", var.write_disposition)
    query                           = local.query
  }
}
