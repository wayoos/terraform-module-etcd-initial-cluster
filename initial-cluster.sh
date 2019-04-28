#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

cluster_size=$1
kube_id=$2

initial_cluster=""
endpoints=""

function etcd_node() {
    local node_id="$kube_id-etcd$1"
    echo "$node_id=http://$node_id.wayoos.net:2380"
}

function etcd_endpoint() {
    local node_id="$kube_id-etcd$1"
    echo "http://$node_id.wayoos.net:2379"
}

initial_cluster=$(etcd_node 0)
endpoints=$(etcd_endpoint 0)

COUNTER=1
while [  $COUNTER -lt $cluster_size ]; do

    node=$(etcd_node $COUNTER)
    initial_cluster="$initial_cluster,$node"

    endpoint=$(etcd_endpoint $COUNTER)
    endpoints="$endpoints,$endpoint"

    let COUNTER=COUNTER+1 
done

echo "{\"initial-cluster\":\"$initial_cluster\",\"endpoints\":\"$endpoints\"}"
