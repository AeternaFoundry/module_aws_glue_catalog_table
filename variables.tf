variable "glue_catalog_tables" {
  description = <<EOT
Map of glue_catalog_tables, attributes below
Required:
    - database_name
    - name
Optional:
    - catalog_id
    - description
    - owner
    - parameters
    - region
    - retention
    - table_type
    - view_expanded_text
    - view_original_text
    - open_table_format_input (block):
        - iceberg_input (required, block):
            - iceberg_table_input (optional, block):
                - location (required)
                - partition_spec (optional, block):
                    - fields (required, block):
                        - field_id (optional)
                        - name (required)
                        - source_id (required)
                        - transform (required)
                    - spec_id (optional)
                - properties (optional)
                - schema (required, block):
                    - fields (required, block):
                        - doc (optional)
                        - id (required)
                        - initial_default (optional)
                        - name (required)
                        - required (required)
                        - type (required)
                        - write_default (optional)
                    - identifier_field_ids (optional)
                    - schema_id (optional)
                    - type (optional)
                - sort_order (optional, block):
                    - fields (required, block):
                        - direction (required)
                        - null_order (required)
                        - source_id (required)
                        - transform (required)
                    - order_id (required)
            - metadata_operation (required)
            - version (optional)
    - partition_index (block):
        - index_name (required)
        - keys (required)
    - partition_keys (block):
        - comment (optional)
        - name (required)
        - parameters (optional)
        - type (optional)
    - storage_descriptor (block):
        - additional_locations (optional)
        - bucket_columns (optional)
        - columns (optional, block):
            - comment (optional)
            - name (required)
            - parameters (optional)
            - type (optional)
        - compressed (optional)
        - input_format (optional)
        - location (optional)
        - number_of_buckets (optional)
        - output_format (optional)
        - parameters (optional)
        - schema_reference (optional, block):
            - schema_id (optional, block):
                - registry_name (optional)
                - schema_arn (optional)
                - schema_name (optional)
            - schema_version_id (optional)
            - schema_version_number (required)
        - ser_de_info (optional, block):
            - name (optional)
            - parameters (optional)
            - serialization_library (optional)
        - skewed_info (optional, block):
            - skewed_column_names (optional)
            - skewed_column_value_location_maps (optional)
            - skewed_column_values (optional)
        - sort_columns (optional, block):
            - column (required)
            - sort_order (required)
        - stored_as_sub_directories (optional)
    - target_table (block):
        - catalog_id (required)
        - database_name (required)
        - name (required)
        - region (optional)
    - view_definition (block):
        - definer (optional)
        - is_protected (optional)
        - last_refresh_type (optional)
        - refresh_seconds (optional)
        - representations (optional, block):
            - dialect (optional)
            - dialect_version (optional)
            - validation_connection (optional)
            - view_expanded_text (optional)
            - view_original_text (optional)
        - sub_object_version_ids (optional)
        - sub_objects (optional)
        - view_version_id (optional)
        - view_version_token (optional)
EOT

  type = map(object({
    database_name      = string
    name               = string
    catalog_id         = optional(string)
    description        = optional(string)
    owner              = optional(string)
    parameters         = optional(map(string))
    region             = optional(string)
    retention          = optional(number)
    table_type         = optional(string)
    view_expanded_text = optional(string)
    view_original_text = optional(string)
    open_table_format_input = optional(object({
      iceberg_input = object({
        iceberg_table_input = optional(object({
          location = string
          partition_spec = optional(object({
            fields = list(object({
              field_id  = optional(number)
              name      = string
              source_id = number
              transform = string
            }))
            spec_id = optional(number)
          }))
          properties = optional(map(string))
          schema = object({
            fields = list(object({
              doc             = optional(string)
              id              = number
              initial_default = optional(string)
              name            = string
              required        = bool
              type            = string
              write_default   = optional(string)
            }))
            identifier_field_ids = optional(list(number))
            schema_id            = optional(number)
            type                 = optional(string)
          })
          sort_order = optional(object({
            fields = list(object({
              direction  = string
              null_order = string
              source_id  = number
              transform  = string
            }))
            order_id = number
          }))
        }))
        metadata_operation = string
        version            = optional(string)
      })
    }))
    partition_index = optional(list(object({
      index_name = string
      keys       = list(string)
    })))
    partition_keys = optional(list(object({
      comment    = optional(string)
      name       = string
      parameters = optional(map(string))
      type       = optional(string)
    })))
    storage_descriptor = optional(object({
      additional_locations = optional(list(string))
      bucket_columns       = optional(list(string))
      columns = optional(list(object({
        comment    = optional(string)
        name       = string
        parameters = optional(map(string))
        type       = optional(string)
      })))
      compressed        = optional(bool)
      input_format      = optional(string)
      location          = optional(string)
      number_of_buckets = optional(number)
      output_format     = optional(string)
      parameters        = optional(map(string))
      schema_reference = optional(object({
        schema_id = optional(object({
          registry_name = optional(string)
          schema_arn    = optional(string)
          schema_name   = optional(string)
        }))
        schema_version_id     = optional(string)
        schema_version_number = number
      }))
      ser_de_info = optional(object({
        name                  = optional(string)
        parameters            = optional(map(string))
        serialization_library = optional(string)
      }))
      skewed_info = optional(object({
        skewed_column_names               = optional(list(string))
        skewed_column_value_location_maps = optional(map(string))
        skewed_column_values              = optional(list(string))
      }))
      sort_columns = optional(list(object({
        column     = string
        sort_order = number
      })))
      stored_as_sub_directories = optional(bool)
    }))
    target_table = optional(object({
      catalog_id    = string
      database_name = string
      name          = string
      region        = optional(string)
    }))
    view_definition = optional(object({
      definer           = optional(string)
      is_protected      = optional(bool)
      last_refresh_type = optional(string)
      refresh_seconds   = optional(number)
      representations = optional(list(object({
        dialect               = optional(string)
        dialect_version       = optional(string)
        validation_connection = optional(string)
        view_expanded_text    = optional(string)
        view_original_text    = optional(string)
      })))
      sub_object_version_ids = optional(list(number))
      sub_objects            = optional(list(string))
      view_version_id        = optional(number)
      view_version_token     = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.open_table_format_input == null || (v.open_table_format_input.iceberg_input.iceberg_table_input == null || (v.open_table_format_input.iceberg_input.iceberg_table_input.partition_spec == null || (length(v.open_table_format_input.iceberg_input.iceberg_table_input.partition_spec.fields) >= 1)))
      )
    ])
    error_message = "Each fields list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.open_table_format_input == null || (v.open_table_format_input.iceberg_input.iceberg_table_input == null || (length(v.open_table_format_input.iceberg_input.iceberg_table_input.schema.fields) >= 1))
      )
    ])
    error_message = "Each fields list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.open_table_format_input == null || (v.open_table_format_input.iceberg_input.iceberg_table_input == null || (v.open_table_format_input.iceberg_input.iceberg_table_input.sort_order == null || (length(v.open_table_format_input.iceberg_input.iceberg_table_input.sort_order.fields) >= 1)))
      )
    ])
    error_message = "Each fields list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.partition_index == null || (length(v.partition_index) <= 3)
      )
    ])
    error_message = "Each partition_index list must contain at most 3 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.partition_index == null || alltrue([for item in v.partition_index : (length(item.index_name) >= 1 && length(item.index_name) <= 255)])
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.retention == null || (v.retention >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.storage_descriptor == null || (v.storage_descriptor.bucket_columns == null || (alltrue([for x in v.storage_descriptor.bucket_columns : length(x) >= 1 && length(x) <= 255])))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.storage_descriptor == null || (v.storage_descriptor.ser_de_info == null || (v.storage_descriptor.ser_de_info.serialization_library == null || (length(v.storage_descriptor.ser_de_info.serialization_library) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.storage_descriptor == null || (v.storage_descriptor.schema_reference == null || (v.storage_descriptor.schema_reference.schema_version_number >= 1 && v.storage_descriptor.schema_reference.schema_version_number <= 100000))
      )
    ])
    error_message = "must be between 1 and 100000"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.storage_descriptor == null || (v.storage_descriptor.skewed_info == null || (v.storage_descriptor.skewed_info.skewed_column_names == null || (alltrue([for x in v.storage_descriptor.skewed_info.skewed_column_names : length(x) >= 1 && length(x) <= 255]))))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.storage_descriptor == null || (v.storage_descriptor.sort_columns == null || alltrue([for item in v.storage_descriptor.sort_columns : (length(item.column) >= 1 && length(item.column) <= 255)]))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.storage_descriptor == null || (v.storage_descriptor.sort_columns == null || alltrue([for item in v.storage_descriptor.sort_columns : (contains([0, 1], item.sort_order))]))
      )
    ])
    error_message = "must be one of: 0, 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.view_definition == null || (v.view_definition.representations == null || alltrue([for item in v.view_definition.representations : (item.dialect_version == null || (length(item.dialect_version) >= 1 && length(item.dialect_version) <= 255))]))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.view_definition == null || (v.view_definition.representations == null || alltrue([for item in v.view_definition.representations : (item.validation_connection == null || (length(item.validation_connection) >= 1 && length(item.validation_connection) <= 255))]))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.view_definition == null || (v.view_definition.representations == null || alltrue([for item in v.view_definition.representations : (item.view_expanded_text == null || (length(item.view_expanded_text) >= 0 && length(item.view_expanded_text) <= 409600))]))
      )
    ])
    error_message = "must be between 0 and 409600 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.view_definition == null || (v.view_definition.representations == null || alltrue([for item in v.view_definition.representations : (item.view_original_text == null || (length(item.view_original_text) >= 0 && length(item.view_original_text) <= 409600))]))
      )
    ])
    error_message = "must be between 0 and 409600 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.view_expanded_text == null || (length(v.view_expanded_text) >= 0 && length(v.view_expanded_text) <= 409600)
      )
    ])
    error_message = "must be between 0 and 409600 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_catalog_tables : (
        v.view_original_text == null || (length(v.view_original_text) >= 0 && length(v.view_original_text) <= 409600)
      )
    ])
    error_message = "must be between 0 and 409600 characters"
  }
  # Note: 21 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

