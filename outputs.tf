output "endpoints_id" {
  description = "Map of id values across all endpoints, keyed the same as var.endpoints except keys with no id are omitted"
  value       = { for k, v in kubernetes_endpoints.endpoints : k => v.id if v.id != null && length(v.id) > 0 }
}
output "endpoints_metadata" {
  description = "Map of metadata values across all endpoints, keyed the same as var.endpoints except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_endpoints.endpoints : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "endpoints_subset" {
  description = "Map of subset values across all endpoints, keyed the same as var.endpoints except keys with no subset are omitted"
  value       = { for k, v in kubernetes_endpoints.endpoints : k => v.subset if v.subset != null && length(v.subset) > 0 }
}

