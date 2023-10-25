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
    remote function createObjective() returns string|error {
        return "";
    }
    // delete objective (mutation)
    remote function deleteObjective() returns string|error {
        return "";
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

