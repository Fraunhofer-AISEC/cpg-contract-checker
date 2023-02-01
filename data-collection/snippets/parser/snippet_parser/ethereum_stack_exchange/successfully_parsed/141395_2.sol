
pragma solidity >=0.8.0 <=0.8.20;

contract CollegeGrades {
    
    struct Course {
        string name;
        uint credits;
        uint grade;
    }

    
    struct Student {
        string name;
        uint age;
        address payable wallet;
        Course[] courses;
    }

    
    mapping(uint => Student) public students;

    
    uint public studentCount;

    
    event StudentAdded(uint id, string name, uint age, address payable wallet);

    
    event CourseAdded(uint id, string name, uint credits, uint grade);

    
    function addStudent(string memory _name, uint _age, address payable _wallet) public {
        uint id = studentCount++;
        students[id] = Student(_name, _age, _wallet, Course[]);
        emit StudentAdded(id, _name, _age, _wallet);
    }

    
    function addCourse(uint _studentId, string memory _name, uint _credits, uint _grade) public {
        
        require(students[_studentId].name != "", "Student does not exist");

        
        Student storage student = students[_studentId];
        uint courseId = student.courses.length++;
        student.courses[courseId] = Course(_name, _credits, _grade);
        emit CourseAdded(_studentId, _name, _credits, _grade);
    }

    
    function getGPA(uint _studentId) public view returns (uint) {
        
        require(students[_studentId].name != "", "Student does not exist");

        
        Student storage student = students[_studentId];
        uint totalCredits = 0;
        uint totalPoints = 0;
        for (uint i = 0; i < student.courses.length; i++) {
            Course storage course = student.courses[i];
            totalCredits += course.credits;
            totalPoints += course.credits * course.grade;
        }
        return totalPoints / totalCredits;
    }
}


