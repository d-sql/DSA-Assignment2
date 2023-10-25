import ballerina/io;

public function main() returns error?{   
 Client:Client user_client = check new Client:Client();
    
    io:println("Select Your Department \n1) 1.HOD \n2) 2.Supervisor \n3) 3.Employee Department \n4)");
    io:println("=========================================================");

    string choice =  io:readln();
} if choice == "1" {
        Types:LecturerArr lecturers = check staff_client->getAllLecturers();
        io:println(lecturers);
    }
    if choice == "2" {
        int staff_number = check int:fromString(io:readln("Enter the staff number: "));
        string name = io:readln("Enter the lecturers fullname: ");
        string title = io:readln("Enter the lecturer's title: ");
        string email = io:readln("Enter the lecturer's email address: ");
        string phone_number = io:readln("Enter the lecturer's phone number in the +264 format: ");

        Types:OfficeArr offices = check staff_client->getAllOffices();
        io:println(offices);

        int office = check int:fromString(io:readln("Please enter an office number for the lecturer: "));

        Types:Lecturer lecturer = {staff_number:staff_number, name:name, title:title, email:email, phone_number:phone_number, office_number: {office_number: office}};
        Types:InlineResponse201 lecturerResult = check staff_client->addLecturer(lecturer);
        io:println(lecturerResult);

    }