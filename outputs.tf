output "glue_catalog_tables_id" {
  description = "Map of id values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_catalog_tables_arn" {
  description = "Map of arn values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "glue_catalog_tables_catalog_id" {
  description = "Map of catalog_id values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.catalog_id if v.catalog_id != null && length(v.catalog_id) > 0 }
}
output "glue_catalog_tables_database_name" {
  description = "Map of database_name values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.database_name if v.database_name != null && length(v.database_name) > 0 }
}
output "glue_catalog_tables_description" {
  description = "Map of description values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.description if v.description != null && length(v.description) > 0 }
}
output "glue_catalog_tables_name" {
  description = "Map of name values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "glue_catalog_tables_open_table_format_input" {
  description = "Map of open_table_format_input values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => one(v.open_table_format_input) if v.open_table_format_input != null && length(v.open_table_format_input) > 0 }
}
output "glue_catalog_tables_owner" {
  description = "Map of owner values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.owner if v.owner != null && length(v.owner) > 0 }
}
output "glue_catalog_tables_parameters" {
  description = "Map of parameters values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.parameters if v.parameters != null && length(v.parameters) > 0 }
}
output "glue_catalog_tables_partition_index" {
  description = "Map of partition_index values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.partition_index if v.partition_index != null && length(v.partition_index) > 0 }
}
output "glue_catalog_tables_partition_keys" {
  description = "Map of partition_keys values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.partition_keys if v.partition_keys != null && length(v.partition_keys) > 0 }
}
output "glue_catalog_tables_region" {
  description = "Map of region values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.region if v.region != null && length(v.region) > 0 }
}
output "glue_catalog_tables_retention" {
  description = "Map of retention values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.retention if v.retention != null }
}
output "glue_catalog_tables_storage_descriptor" {
  description = "Map of storage_descriptor values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => one(v.storage_descriptor) if v.storage_descriptor != null && length(v.storage_descriptor) > 0 }
}
output "glue_catalog_tables_table_type" {
  description = "Map of table_type values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.table_type if v.table_type != null && length(v.table_type) > 0 }
}
output "glue_catalog_tables_target_table" {
  description = "Map of target_table values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => one(v.target_table) if v.target_table != null && length(v.target_table) > 0 }
}
output "glue_catalog_tables_view_definition" {
  description = "Map of view_definition values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => one(v.view_definition) if v.view_definition != null && length(v.view_definition) > 0 }
}
output "glue_catalog_tables_view_expanded_text" {
  description = "Map of view_expanded_text values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.view_expanded_text if v.view_expanded_text != null && length(v.view_expanded_text) > 0 }
}
output "glue_catalog_tables_view_original_text" {
  description = "Map of view_original_text values across all glue_catalog_tables, keyed the same as var.glue_catalog_tables"
  value       = { for k, v in aws_glue_catalog_table.glue_catalog_tables : k => v.view_original_text if v.view_original_text != null && length(v.view_original_text) > 0 }
}

