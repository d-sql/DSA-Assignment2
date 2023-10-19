import ballerina/io;
import ballerinax/kafka;


configurable string GROUP_ID = ?;
// topic that clients send their requests to
configurable string ADMIN_REQ = ?;
// topics that admin producer sends messages to
configurable string GYNO_REQ = ?;

configurable decimal POLLING_INTERVAL = ?;

kafka:ConsumerConfiguration adminConsumerConfig = {
    groupId: GROUP_ID,
    topics: [ADMIN_REQ],
    offsetReset: kafka:OFFSET_RESET_EARLIEST,
    pollingInterval: POLLING_INTERVAL
};


service on new kafka:Listener(kafka:DEFAULT_URL, adminConsumerConfig) {

    private final kafka:Producer adminProducer;

    function init() {
        do {
	        self.adminProducer = check new (kafka:DEFAULT_URL);
        } on fail var e {
        	io:println(string `Error occurred: ${e.message()}`);
        }
    }

    remote function onConsumerRecord(kafka:Caller caller, AdminRequest[] requests) returns kafka:Error? {
        foreach AdminRequest req in requests {
            match req.specialist_type{
                GYNOCOLOLOGIST => {
                    io:println("GYNOCOLOLOGIST");   
                    do {
                        check self.adminProducer->send({
                            topic: GYNO_REQ,
                            value:  req
                        });
                    }
                }
                UROLOGIST => {
                    io:println("UROLOGIST");
                }
                PEDIATRICIAN => {
                    io:println("PEDIATRICIAN");   
                }
                _ => {
                    io:println("Invalid request");
                }
            }
        }
    }
}

