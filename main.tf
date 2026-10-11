resource "kubernetes_endpoints" "endpoints" {
  for_each = var.endpoints


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  dynamic "subset" {
    for_each = each.value.subset != null ? each.value.subset : []
    content {
      dynamic "address" {
        for_each = subset.value.address != null ? subset.value.address : []
        content {
          hostname  = address.value.hostname
          ip        = address.value.ip
          node_name = address.value.node_name
        }
      }
      dynamic "not_ready_address" {
        for_each = subset.value.not_ready_address != null ? subset.value.not_ready_address : []
        content {
          hostname  = not_ready_address.value.hostname
          ip        = not_ready_address.value.ip
          node_name = not_ready_address.value.node_name
        }
      }
      dynamic "port" {
        for_each = subset.value.port != null ? subset.value.port : []
        content {
          name     = port.value.name
          port     = port.value.port
          protocol = port.value.protocol
        }
      }
    }
  }
}

