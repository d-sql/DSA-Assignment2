import ballerina/time;
type User record {|
    readonly string staff_id;
    string first_name;
    string last_name;
    string position;
    string faculty_department;
|};

enum JobTitle{
    HOD,
    EMP,
    SUP
}

type KPI record {|
    string id;
    string name;
    string content;
    time:Date date_created;
    float weight;
    float grade;
    string unit;
|};

type Authentication record {|
    string username;
    int pin;
    string staff_id;
|};

type Supervisor record {|
    string[] subordinates;
|};

type Employees record {|
    KPI[] key_performance_indicators;
|};

type Objective record {|
    string content;
    string created_by;
    time:Date date_added;
|};