
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

    
    function addStudent(Student memory newStudent) public {

        require(newStudent.wallet == address(0), "Student with that wallet/address already exists !!!");

        
        uint id = studentCount++;

        
        students[id].name = newStudent.name;
        students[id].age = newStudent.age;
        students[id].wallet = newStudent.wallet;

        emit StudentAdded(id, newStudent.name, newStudent.age, newStudent.wallet);
    }

    
    function addCourse(uint _studentId, Course memory newCourse) public {
        
        require(students[_studentId].wallet != address(0), "Student does not exist");

        
        Student storage student = students[_studentId];

       
        student.courses.push(newCourse);

        emit CourseAdded(_studentId, newCourse.name, newCourse.credits, newCourse.grade);
    }

    
    function getGPA(uint _studentId) public view returns (uint) {
        
        require(students[_studentId].wallet != address(0), "Student does not exist");

        
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
