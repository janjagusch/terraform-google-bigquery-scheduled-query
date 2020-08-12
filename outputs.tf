output "config" {
  value = local.config
}

output "query" {
  value = local.query
}

output "scheduled_query" {
  value = google_bigquery_data_transfer_config.scheduled_query
}
