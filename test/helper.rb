require "mongo"
MongoConn = Mongo::Connection.new
TestDB = MongoConn.db("test")
TestColl = TestDB.collection "as_mongo_records"

