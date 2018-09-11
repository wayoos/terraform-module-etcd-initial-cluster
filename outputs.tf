output "initial-cluster" {
  value       = "${data.external.initial-cluster.result["initial-cluster"]}"
  description = "Initial cluster"
}
