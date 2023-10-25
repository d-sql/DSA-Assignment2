// import ballerina/graphql;
import ballerina/io;

public function main() returns error? {
    //  Client:Client user_client = check new Client:Client();

    while true {
        io:println("LOGIN");
        io:println("====================================================================================");
        io:println("Select Your Staff Position \n1) 1=HOD \n2) 2=Supervisor \n3) 3=Employee \n4) q=Exit");
        io:println("====================================================================================");

        string choice = io:readln();

        //Login as HOD
        if choice == "1" {
            string staff_id = io:readln("Enter the HOD ID : ");
            int staff_pin = check int:fromString(io:readln("Enter the User PIN : "));
            //Checking Login Credentials for HOD

            string proceed_to = io:readln("Proceed to...  \n1) 1A=Create department objectives \n2) 1B=Delete department Objective \n3) 1C=View Employees Total Score \n4) 1D=Assign Employee to Supervisor \n5)");

            //Create department objectives
            if proceed_to == "1" {
                // string name = io:readln("Change Name To: ");
                // lecturer.name = name;
            }
            //Delete department objectives
            else if proceed_to == "2"{

            }
            //View Employees Total Scores
            else if proceed_to == "3"{

            }
            //Assign the Employee to a supervisor 
            else if proceed_to == "4"{

            }
            else {
                io:println("Invalid Input Entered");
                continue;
            }
            // if change_to == "title" {
            //     string title = io:readln("Change Title To: ");
            //     lecturer.title = title;
            // }
            // if change_to == "email" {
            //     string email = io:readln("Change Email To: ");
            //     lecturer.email = email;
            // }
            // if change_to == "phone_number" {
            //     string phone_number = io:readln("Change Phone Number To: ");
            //     lecturer.phone_number = phone_number;
            // }
            // if change_to == "office_number" {
            //     Types:OfficeArr offices = check staff_client->getAllOffices();
            //     io:println(offices);

            //     int office = check int:fromString(io:readln("Change Office Number To: "));
            //     lecturer.office_number = {office_number: office};
            // }

            // Types:Lecturer lecturerResult = check staff_client->updateLecturer(staff_number, lecturer);
            // io:println(lecturerResult);

        }

        //Login as Supervisor
        else if choice == "2" {
            string staff_id = io:readln("Enter the Supervisor ID : ");
            int staff_pin = check int:fromString(io:readln("Enter the User PIN : "));
            //Approve Employee's KPIs. 

            //Delete Employee’s KPIs. 

            //Update Employee's KPIs

            //View Employee Scores. (Only employees assigned to him/her)

            //Grade the employee’s KPIs
        }

        //LOgin as Employee
        else if choice == "3" {
            string staff_id = io:readln("Enter the Employee ID : ");
            int staff_pin = check int:fromString(io:readln("Enter the User PIN : "));
            //Create their KPIs 

            //Grade their Supervisor 

            //View their Scores 
        }
        else if choice == "q"{
            break;
        } else{
            io:println("Invalid Option Entered");
            continue;
        }
    }

}

