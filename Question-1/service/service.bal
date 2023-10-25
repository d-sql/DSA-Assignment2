import ballerina/io;
import ballerina/graphql;
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
        // implement logic to get and calc total scores for all emp

        map<json>[] employees = check db->find(userCollection, S34, {role: "EMP"}, {});

        var employeeTotalScores = [EmployessTotalScores]{};

        foreach var employee in employees {
            string usernmae = employee.username;

            map<json>[] kpis = check db->find(kpiCollection, S34, {employeeUsername: username}, {});

            // calc total scores
            float total_scores = 0.0;
            foreach var kpi in kpis {
                float grade = kpi.grade;
                total_score += grade;

                EmployeeTotalScore totalScoreObj = { username: username, total_score: total_score };
                employeeTotalScores.push(totalScoreObj);
            }

            return employeeTotalScores;
        }
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
    remote function createKPI() returns string|error {
        return "";
    }

    // Grade their Supervisor (mutation)
    remote function gradeSuperviser() returns string|error {
        return "";
    }

    // View Their Scores (query)
    resource function get viewScores() {
        
    }
}

