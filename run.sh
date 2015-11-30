#!/bin/bash

export LIBPROCESS_IP=$(ip a show dev eth0 | grep inet | grep eth0 | sed -e 's/^.*inet.//g' -e 's/\/.*$//g')
export MESOS_NATIVE_LIBRARY=/usr/lib/libmesos.so

mv ../spark-scheduler-master/spark-defaults.conf conf/

/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java -cp $(pwd)/conf/:$(pwd)/lib/spark-assembly-1.5.2-hadoop2.6.0.jar:$(pwd)/lib/datanucleus-core-3.2.10.jar:$(pwd)/lib/datanucleus-rdbms-3.2.9.jar:$(pwd)/lib/datanucleus-api-jdo-3.2.6.jar -Xms3g -Xmx6g -XX:MaxPermSize=256m org.apache.spark.deploy.mesos.MesosClusterDispatcher --host $LIBPROCESS_IP $@
