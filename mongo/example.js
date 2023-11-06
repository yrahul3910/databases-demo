const MongoClient = require('mongodb').MongoClient;

// Connection URL
const url = `mongodb://localhost`;

// Create a new MongoClient
const client = new MongoClient(url);

// Use connect method to connect to the Server
(async () => {
    await client.connect();

    console.log("Connected successfully to server");

    const coll = client.db('db').collection('test');

    // Find documents where the street address contains "Main St"
    let docs = await coll.find({'address.street': /Main St/}).toArray();
    console.log("Found the following records");
    console.log(docs)

    // Close the client
    client.close();
})();
