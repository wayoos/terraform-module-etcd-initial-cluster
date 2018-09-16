#--------------------------------
#     DNS LOOKUPS module
#--------------------------------

data "external" "initial-cluster" {
  program = ["bash", "${path.module}/initial-cluster.sh", "${var.cluster_size}", "${var.kube_id}"]
}
