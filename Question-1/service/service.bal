// import ballerina/io;
import ballerina/graphql;

@graphql:ServiceConfig {
    graphiql: {
        enabled: true,
    path: "/byron"
    }
}

service /byron on new graphql:Listener(5588) {
    // Login 

    /// HOD 
    // create objective (mutation)

    // delete objective (mutation)

    // view employee total scores (query)

    // assign employee to supervisor (mutation)

    /// Supervisors
    // Approve Employee's KPIs. (mutation)

    // Delete Employee’s KPIs. (mutation)

    // Update Employee's KPIs. (muation)

    // View Employee Scores. (Only employees assigned to him/her). (query)

    // Grade the employee’s KPIs (mutation)

    /// Employees 
    // Create their KPIs (mutation)
    
    // Grade their Supervisor (mutation)
    
    // View Their Scores (query)
}

