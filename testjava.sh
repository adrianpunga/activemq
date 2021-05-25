#!/bin/bash
# Run using command: ./testjava.sh <masterIP>:<masterPORT> <slaveIP>:<slavePORT> <broker_admin> <broker_password>
echo "1. EXECUTE THE PRODUCER for 100 messages"
java -jar ActiveMQ.jar $1 $2 $3 $4 producer exampleQueue 100
echo "2. EXECUTE THE CONSUMER for 10 messages"
java -jar ActiveMQ.jar $1 $2 $3 $4 consumer exampleQueue 10
echo "3. STOP the MASTER"
sudo /home/opc/master/bin/artemis-service stop
echo "4. EXECUTE THE CONSUMER for 10 messages"
java -jar ActiveMQ.jar $1 $2 $3 $4 consumer exampleQueue 10
echo "5. EXECUTE THE CONSUMER for 10 messages"
java -jar ActiveMQ.jar $1 $2 $3 $4 consumer exampleQueue 10
echo "6. START the MASTER"
sudo /home/opc/master/bin/artemis-service start
echo "7. EXECUTE THE CONSUMER for 10 messages"
java -jar ActiveMQ.jar $1 $2 $3 $4 consumer exampleQueue 10
echo "8. EXECUTE THE CONSUMER for 10 messages"
java -jar ActiveMQ.jar $1 $2 $3 $4 consumer exampleQueue 10
