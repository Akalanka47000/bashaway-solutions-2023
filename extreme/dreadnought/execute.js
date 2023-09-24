const crypto = require('crypto');
const { Kafka } = require('kafkajs')

const kafka = new Kafka({
  clientId: crypto.randomBytes(16).toString('hex'),
  brokers: ['localhost:9092'],
});

const admin = kafka.admin();

const producer = kafka.producer();

(async ()=> {
  await admin.connect()
  await producer.connect()
  await admin.createTopics({
    waitForLeaders: true,
    topics: [
      {
        topic: "SOS",
        numPartitions: 1,
        replicationFactor:1,
      },
    ],
  })
  setInterval(()=>{
    producer.send({
      topic: "SOS",
      messages: [{
        key: crypto.randomUUID(),
        value: crypto.randomUUID(),
      }],
      idempotent: true,
    })
  }, 1000)
})()

