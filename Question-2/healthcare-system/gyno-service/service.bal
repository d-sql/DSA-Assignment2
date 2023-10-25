import ballerina/io;
import ballerinax/kafka;
import ballerinax/mongodb;
import gyno_service.data_source as ds;

configurable string GROUP_ID = ?;
// topics that admin producer sends messages to
configurable string GYNO_REQ = ?;

configurable decimal POLLING_INTERVAL = ?;

kafka:ConsumerConfiguration gynoConsumerConfig = {
    groupId: GROUP_ID,
    topics: [GYNO_REQ],
    offsetReset: kafka:OFFSET_RESET_EARLIEST,
    pollingInterval: POLLING_INTERVAL
};

service on new kafka:Listener(kafka:DEFAULT_URL, gynoConsumerConfig) {
final mongodb:Client mongoClient;
    function init() {
do {
	self.mongoClient = check new (ds:mongoConfig);
} on fail var e {
	io:println(string `Error: ${e.message()}`);
}
        
    }
    remote function onConsumerRecord(kafka:Caller caller, AdminRequest[] records) returns kafka:Error?|error {
        from AdminRequest req in records
        where req.specialist_type == GYNOCOLOLOGIST
        do {
            io:print(req);
            // TODO: Add db functionality 
           
        };
    }
}
