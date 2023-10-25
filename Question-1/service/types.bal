type User record {|
    readonly string staff_id;
    string first_name;
    string last_name;
|};

type KPI record {|
    string content;
    boolean isApproved;
|};

type Supervisor record {|
    string[] subordinates;
|};

type Employees record {|
    KPI[] key_performance_indicators;
|};