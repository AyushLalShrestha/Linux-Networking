# Get Up and running with zookeeper with Kafka:
1. bin/zookeeper-server-start.sh config/zookeeper.properties
2. bin/kafka-server-start.sh config/server.properties

3. bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

4. bin/kafka-topics.sh --list --zookeeper localhost:2181

<!-- Produce -->
5. bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

<!-- Consume -->
6. bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

<!-- Info of a topic -->
7. bin/kafka-topics.sh --describe --bootstrap-server localhost:9092 --topic test

<!-- Check a consumer group offset in a broker -->
8. bin/kafka-consumer-groups --bootstrap-server 127.0.0.1:9092 --describe --group consumer-group-name

<!-- Run java consumer program -->
9. 1. javac -cp "/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /kafka-clients-2.0.0.jar:/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /slf4j-api-1.7.25.jar:"  com.als.producers.SimpleProducer.java

9. 2. java -cp "/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /kafka-clients-2.0.0.jar:/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /slf4j-api-1.7.25.jar:" SimpleProducer

9. 1. javac -cp "/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /kafka-clients-2.0.0.jar:/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /slf4j-api-1.7.25.jar:"  com.als.consumers.SimpleConsumer.java

9. 2. java -cp "/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /kafka-clients-2.0.0.jar:/Users/ayushshrestha/Downloads/JAR_Downloads/Kafka Clients /slf4j-api-1.7.25.jar:" SimpleConsumer