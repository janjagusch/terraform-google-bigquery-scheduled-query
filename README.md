# terraform-google-bigquery-scheduled-query

A Terraform module for creating BigQuery scheduled queries.

## Usage

### Config

Scheduled queries are defined in `config.yaml` files:

```yaml
dataset_id: my_dataset
table_id: my_table
location: EU
schedule: every day 01:00
write_disposition: WRITE_TRUNCATE
query: SELECT * FROM my_source_table
```

Instead of writing the `query` directly, you can also reference to a `query_file`:

```yaml
dataset_id: my_dataset
table_id: my_table
location: EU
schedule: every day 01:00
write_disposition: WRITE_TRUNCATE
query_file: ./query.sql
```

Where the `query_file` path is relative to the location of `config.yaml`. The query file can also contain placeholder variables that can be templated.

You can find an example in the [example](./example) folder.

## Authors

* Jan-Benedikt Jagusch <jan.jagusch@gmail.com>
