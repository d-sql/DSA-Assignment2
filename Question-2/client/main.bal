import ballerina/io;
import ballerinax/kafka;

final kafka:Producer adminProducer = check new (kafka:DEFAULT_URL);

public function main() {
    string fName = io:readln("Enter your first name: ");
    string lName = io:readln("Enter your last name: ");
    string phone = io:readln("Enter your phone number: ");
    io:println("1. GYNOCOLOGIST");
    // io:println("2. UROLOGIST");
    // io:println("3. DERMATOLOGY");
    int|error specialist = int:fromString(io:readln("Enter the specialist type [1 - 3]: "));
    string details = io:readln("Enter appointment details: ");

    if specialist !is error {
        AdminRequest new_req = {
            first_name: fName,
            last_name: lName,
            phone_number: phone,
            details: details,
            specialist_type: GYNOCOLOLOGIST
        };

        do {

            check adminProducer->send({
                topic: "admin-req",
                value: new_req
            });
        } on fail var e {
            io:println(string `Error: ${e.message()}`);
        }
    } else {
        io:println("Invalid specialist selected");
    }
}
