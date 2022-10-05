contract Student{
    uint ID;
    struct stu{
        string name;
        uint age;
        bool tookTest;
    }
    mapping(uint => stu) StudentNames;
    function Student(string _name,uint _age) {
        
        stu s = StudentNames[ID];
        s.name = _name;
        s.age = _age;
        s.tookTest = false;
    }
}

contract ClassRoom {
    address studentAddr;
    Student student;
    function ClassRoom(address addr) {
        studentAddr = addr;
        student = Student(addr);
    }

    
}
