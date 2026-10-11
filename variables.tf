variable "endpoints" {
  description = <<EOT
Map of endpoints, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
Optional:
    - subset (block):
        - address (optional, block):
            - hostname (optional)
            - ip (required)
            - node_name (optional)
        - not_ready_address (optional, block):
            - hostname (optional)
            - ip (required)
            - node_name (optional)
        - port (optional, block):
            - name (optional)
            - port (required)
            - protocol (optional)
EOT

  type = map(object({
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    subset = optional(list(object({
      address = optional(list(object({
        hostname  = optional(string)
        ip        = string
        node_name = optional(string)
      })))
      not_ready_address = optional(list(object({
        hostname  = optional(string)
        ip        = string
        node_name = optional(string)
      })))
      port = optional(list(object({
        name     = optional(string)
        port     = number
        protocol = optional(string)
      })))
    })))
  }))
}

