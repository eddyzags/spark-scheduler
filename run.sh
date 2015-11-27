#!/bin/bash

export LIBPROCESS_IP=$(ip a show dev eth0 | grep inet | grep eth0 | sed -e 's/^.*inet.//g' -e 's/\/.*$//g')

sbin/spark-daemon.sh start org.apache.spark.deploy.mesos.MesosClusterDispatcher 1 --host $LIBPROCESS_IP --port 7077 --master mesos://zk://5.196.75.109:2181,5.196.75.110:2181,5.196.75.111:2181/mesos --zk 5.196.75.109:2181,5.196.75.110:2181,5.196.75.111:2181 --name spark-scheduler --webui-port 7078
