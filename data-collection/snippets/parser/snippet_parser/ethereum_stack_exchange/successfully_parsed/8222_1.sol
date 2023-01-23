contract Student{
    struct stu{
        string name;
        uint age;
        bool tookTest;
    }
    mapping(uint => stu) public studentNames;
    function addStudent (uint ID, string _name, uint _age) {
        studentNames[ID] = stu(_name, _age, false);
    }
    function updateStudent (uint ID) {
        studentNames[ID].tookTest = true;
    }
}
