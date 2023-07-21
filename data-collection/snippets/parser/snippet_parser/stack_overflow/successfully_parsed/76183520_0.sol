address  is_admin;
constructor(){
    is_admin = msg.sender;
}

modifier onlyAdmin(address x) {
    require(x== is_admin, "Permission Denied. You do not have admin access.");
    _;  }

uint s_counter=0;

struct students_marks{
    uint id;
    uint mark;
}

struct  all_courses{

    string course_name ;
    uint mark ;
}

struct warning {

    string date ;
    string description;
}

struct  course {
    string name ;
    uint id;
    uint weekly_hours;
    uint level ;

    
    students_marks[] marks;
    }

    struct prof {
    
    uint id ;
    string firstName;
    string lastName;
    string fatherName;
    string motherName;
    string gender;
    string email;
    string collegeName;
    string dateOfBirth;
    string mobileNumber; 
    string specialization ;


}

struct  student  {

    uint  id ;
    string firstName;
    string lastName;
    string fatherName;
    string motherName;
    string gender;
    string email;
    string collegeName;
    string dateOfBirth;
    string mobileNumber;
    
    all_courses[] course;
    
    warning[] s_warnings;
    
    }

student[] studentList ;
prof[] profList;
course[] courselist; 

mapping(uint => student) public getstudent;
mapping(uint => prof) public getprof;   
mapping(uint => course) public getcours; 
