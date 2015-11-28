#!/bin/bash

export LIBPROCESS_IP=$(ip a show dev eth0 | grep inet | grep eth0 | sed -e 's/^.*inet.//g' -e 's/\/.*$//g')

$(pwd)/sbin/spark-daemon.sh start org.apache.spark.deploy.mesos.MesosClusterDispatcher 1 --host $LIBPROCESS_IP $@
