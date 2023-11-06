# Databases Demo

## Building the Docker image

```bash
git clone https://github.com/yrahul3910/databases-demo.git
cd databases-demo
docker build -t db-demo .
```

## MySQL via EF Core

### Setup

```
/etc/init.d/mysql start
cd mysql
mysql < init.sql
```

Run `mysql`, and type the following commands:

```sql
CREATE USER 'myUsername'@'localhost' IDENTIFIED BY 'myPassword';
GRANT ALL PRIVILEGES ON db.* TO 'myUsername'@'localhost';
FLUSH PRIVILEGES;
```

### Add the first database migration

Code based on [these docs](https://learn.microsoft.com/en-us/ef/core/get-started/overview/first-app?tabs=netcore-cli#install-entity-framework-core).

At this point, you would add your model's code. Instead, you will save time by checking out the code at this point:

```
dotnet ef migrations list
dotnet ef database update
```

You've now updated the database! We can query it. Let's get the new code:

```
dotnet run
```

You should see the output:

```
Database path: /root/.local/share/blogging.db.
Inserting a new blog
Querying for a blog
Got blog with URL: http://blogs.msdn.com/adonet
Updating the blog and adding a post
Delete the blog
```

## MongoDB

### Install

```
apt-get install -y mongodb-org
mongod --fork --logpath /var/log/mongod.log
```

### Load data

We will use the `mongoimport` tool to do this. In the `mongo/` directory, run:

```
mongoimport --db test --file data.json --jsonArray
```

### Run example

We will now fetch the code for the example and run it:

```
npm i mongodb
node example.js
```
