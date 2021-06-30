# Confluent Cloud Connect
Quicky get access to Confluent Cloud with this script. This repo runs a standalone Kafka connect worker which is preconfigured to connect to a Confluent Cloud instance.
It includes two source connectors:
--Confluent syslog source connector: https://www.confluent.io/hub/confluentinc/kafka-connect-syslog. You can forward syslog to this instance and it will produce in Confluent Cloud.
--Kafka File Stream Connector: https://docs.confluent.io/home/connect/filestream_connector.html. See below details for adding files into Confluent Cloudt

To get started:
```
1. git clone https://github.com/JohnnyMirza/CCloud_Connect.git
2. edit the .env file and fill in your credentials. To get the details Login to Confluent Cloud then to your Environment, and follow steps below:
-CLOUD_URL: cluster->Settings->Bootstrap server
-CLOUD_TOKEN: cluster->API keys
-CLOUD_SECRET: cluster->API keys
-SCHEMA_REGISTRY_URL: Environment->Schema Registry->API endpoint
-SCHEMA_REGISTRY_BASIC_AUTH: Environment->Schema Registry->API credentials (e.g. SCHEMA_REGISTRY_BASIC_AUTH='key':'secret')
3. Create your topic in Confluent Cloud e.g. KAFKA_TOPIC_NAME=? and FS_TOPIC_NAME=? (see .env file)
4. docker-compose up -d
```


**Syslog
Once the instance is started, the Syslog connector is listening on localhot port 5555. You can test syslog by running the following, and you should see the message in Confluent Cloud console:
-`echo "<133>${0##*/}[$$]: Test syslog message from Netcat" | nc -w1 localhost 5555`

**FileStream
The test.txt file is located in the files directoy of the repo. To change the file change the `FS_FILE` setting in the .env file and docker-compose up -d again.
To test filestream you can edit the test.txt file or `echo "Test 123" >> ./files/test.txt'
