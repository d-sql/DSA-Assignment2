# GraphQL
## Description
The Faculty of Computing and Informatics (FCI) at NUST has initiated the development of a Performance Management System. 

This system is designed to track the performance of
staff members consistently and measurably within the faculty. The process of tracking staff performance involves three key users: the Head of Department (HoD), the employee, and
the supervisor.

To assess the performance of staff members, each department within the Faculty establishes annual objectives. Each of these objectives contributes a certain percentage to
the overall departmental goals. Additionally, every employee within a department has specific Key Performance Indicators (KPIs) that are directly related to these departmental
objectives.

Furthermore, supervisors are responsible for evaluating and grading the KPIs of their respective employees. These KPIs may be measured using various units, depending on the specific metric being assessed. 

These units can include percentages, time, counts
(numbers), currency, scores (e.g., on a scale of 1 to 10), ratios, units of measurement (e.g., kilograms, litres), distances, and others.

Moreover, the system is designed to calculate an employee's score (ranging from 1 to 5) for each KPI once the appropriate unit is inputted. 

Finally, the system is capable of computing the total scores of employees, presented as a percentage of the department's objectives.

All the information to be used must be input into the system and stored in a database (e.g., MySQL or MongoDB). 
Furthermore, every operation within the system necessitates the
successful authentication of the user with the appropriate authorization. The authorization model is defined as follows:
### HoD
- Create department objectives.
- Delete department objectives.
- View Employees Total Scores.
- Assign the Employee to a supervisor.
### Supervisor
- Approve Employee's KPIs.
- Delete Employee’s KPIs.
- Update Employee's KPIs.
- View Employee Scores. (Only employees assigned to him/her).
- Grade the employee’s KPIs
### Employee
- Create their KPIs
- Grade their Supervisor
- View Their Scores

Your task is implementing the client and service in the Ballerina language using GraphQL.

### Additional Information Note:
Key Performance Indicators(KPIs) are specific, measurable metrics or targets used to evaluate the performance of individual employees within an organization. For example, a
lecturer's KPIs can be Peer Recognition, Professional Development, Student Progress and Success, Innovative teaching methods, Research Output etc.

#### Important things to note:
1. You need to store user information, like first name, last name, job title, position, and
role, along with performance records, including KPIs and objectives, in a data store,
such as MongoDB or SQL databases.
2. Use GraphQL for communication between client and server.
3. Implement the client and server in the Ballerina Language.
4. Deploy the service and client in Docker containers.

## Evaluation criteria
- Setup of the MongoDB/SQL instance. **(10 marks)**.
- Docker container configuration. **(5 marks)**.
- Implementation of the client in the Ballerina language. **(10 marks)**.
- Implement the services in the Ballerina language. **(25 marks)**.