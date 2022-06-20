contract StudentsInfoTracker{

    Student[] students;

    struct Student{
        string name;
        address ethAddress;
        uint numberInClass;
        uint[] marks;
    }
    function getStudent(uint) public view returns(string memory name, address ethAddress, uint numberInClass, uint[] memory marks){
        return(students[uint].name, students[uint].ethAddress, students[uint].numberInClass, students[uint].marks);
    }
}