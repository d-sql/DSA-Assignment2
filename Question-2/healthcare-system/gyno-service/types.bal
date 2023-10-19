type AdminRequest readonly & record {|
    string first_name;
    string last_name;
    string phone_number;
    string details;
    SpecialistType specialist_type;
|};

enum SpecialistType{
    GYNOCOLOLOGIST,
    PEDIATRICIAN,
    UROLOGIST
}
