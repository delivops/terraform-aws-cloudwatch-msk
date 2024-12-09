data "aws_msk_cluster" "target_cluster" {
  cluster_name = var.cluster_name
}
data "aws_msk_broker_nodes" "broker_nodes" {
  cluster_arn = data.aws_msk_cluster.target_cluster.arn
}

locals {
  broker_ids = [
    for broker in data.aws_msk_broker_nodes.broker_nodes.node_info_list : broker.broker_id
  ]
}
