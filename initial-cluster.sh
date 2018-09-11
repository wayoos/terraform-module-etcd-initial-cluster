#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

cluster_size=$1
kube_id="de1"
initial_cluster=""

function etcd_node() {
    local node_id="etcd$1-$kube_id"
    echo "$node_id=http://$node_id.wayoos.net:2380"
}

initial_cluster=$(etcd_node 0)

COUNTER=1
while [  $COUNTER -lt $cluster_size ]; do

    node=$(etcd_node $COUNTER)
    initial_cluster="$initial_cluster,$node"

    let COUNTER=COUNTER+1 
done


echo "{\"initial-cluster\":\"$initial_cluster\"}"
