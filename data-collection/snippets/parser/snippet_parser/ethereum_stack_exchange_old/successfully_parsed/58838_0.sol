contract Courses {

    struct Instructor {
        uint age;
        string fName;
        string lName;
    }

    mapping (address => Instructor) instructors;
    address[] public instructorAccts;

}
