output "initial-cluster" {
  value       = "${data.external.initial-cluster.result["initial-cluster"]}"
  description = "Initial cluster"
}

output "endpoints" {
  value = "${data.external.initial-cluster.result["endpoints"]}"
}
