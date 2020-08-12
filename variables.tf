variable "config_file" {
  type        = string
  description = "Path to the config.yaml. Config values take precedence over all other variables."
  default     = null
}

variable "query_vars" {
  type        = map(string)
  description = "Values for placeholder variables in query."
  default     = {}
}

variable "dataset_id" {
  type        = string
  description = "ID of the dataset."
  default     = null
}

variable "table_id" {
  type        = string
  description = "ID of the table."
  default     = null
}

variable "location" {
  type        = string
  description = "Location of the data transfer."
  default     = null
}

variable "schedule" {
  type        = string
  description = "Schedule of the data transfer."
  default     = null
}

variable "write_disposition" {
  type        = string
  description = "Can be 'WRITE_TRUNCATE' or 'WRITE_APPEND'."
  default     = null
}
