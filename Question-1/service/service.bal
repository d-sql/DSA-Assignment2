import ballerina/io;
import ballerina/graphql;
import ballerina/time;
import ballerinax/mongodb;

configurable string MONGO_HOST = ?;
configurable int MONGO_PORT = ?;
configurable string MONGO_USER = ?;
configurable string MONGO_PASSWORD = ?;
configurable string DB_NAME = ?;

mongodb:ConnectionConfig mongoConfig = {
    connection: {
        host: MONGO_HOST,
        port: MONGO_PORT,
        auth: {
            username: MONGO_USER,
            password: MONGO_PASSWORD
        },
        options: {
            sslEnabled: false,
            serverSelectionTimeout: 5000
        }
    },
    databaseName: DB_NAME
};

@graphql:ServiceConfig {
    graphiql: {
        enabled: true,
        path: "/byron"
    }
}
service /byron on new graphql:Listener(5588) {
    private mongodb:Client db;

    function init() {
        do {
            self.db = check new (mongoConfig);

        } on fail var e {
            io:println(string `Error occurred: ${e.message()}`);
        }

    }
    // Login
    resource function get login(string staff_id, int pin, JobTitle role) {

    }

    /// HOD 
    // create objective (mutation)
    remote function createObjective(Objective newObjective) returns string|error {
        map<json> doc = <map<json>>newObjective.toJson();
        _ = check db->insert(doc, objectiveCollection, "");
        return string `${newObjective.name} added successfully`;
    }


    // delete objective (mutation)
    remote function deleteObjective(string id) returns string|error {
       mongodb:Error|int deleteObjective = db->delete(objectiveCollection, "", {id: id}, false);
       if deleteObjective is mongoddb:Error {
        return error("Failed to delete objective");
       }  else {
        if deleteObjective > 0 {
            return string `${id} deleted successfully`;
        } else {
            return string `objective unavailable`;
        }
       }
    }


    // view employee total scores (query)
    resource function get viewAllEmployeeTotalScores() {

    }

    // assign employee to supervisor (mutation)
    remote function assignEmployeeSupervisor() returns string|error {
        return "";
    }

    /// Supervisors
    // Approve Employee's KPIs. (mutation)
    remote function approveEmployeeKPI() returns string|error {
        return "";
    }

    // Delete Employee’s KPIs. (mutation)
    remote function deleteEmployeeKPI() returns string|error {
        return "";
    }

    // Update Employee's KPIs. (muation)
    remote function updateEmployeeKPI() returns string|error {
        return "";
    }

    // View Employee Scores. (Only employees assigned to him/her). (query)
    resource function get viewAssingnedEmployeeScores() {

    }

    // Grade the employee’s KPIs (mutation)
    remote function gradeEmployeeKPI() returns string|error {
        return "";
    }

    /// Employees 
    // Create their KPIs (mutation)
    remote function createKPI(string staff_id, string indicator) returns string|error {
        // get employee
        stream<map<json>, error?> data = check self.db->find("users", DB_NAME, {staff_id: staff_id}, {}, {}, 1);

        map<json>[] employees = check from var emp in data
            where emp.job_title == EMP
            select emp;

        if employees.length() > 0 {
            // create KPI
            KPI kpi = {
                content: indicator,
                date_created: time:utcNow(),
                grade: 0.0,
                name: indicator,
                unit: "",
                weight: 0.0,
                id: ""
            };
            int|mongodb:Error res = self.db->update({...employees[0], kpi}, "users", DB_NAME, {staff_id: staff_id}, false, false);

            if res !is mongodb:Error {
                if res > 0 {
                    return "KPI added successfully";
                } else {
                    return error("No rows updated");
                }
            } else {
                return error(res.message());
            }
        }
        return error("Employee does not exist");
    }

    // Grade their Supervisor (mutation)
    remote function gradeSuperviser() returns string|error {
        return "";
    }

    // View Their Scores (query)
    resource function get viewScores() {

    }
}

