contract Department {

    function enroll(uint depID, address student) returns (bool ret) {
           return true;
    }
}

contract College {
    address student;
    Department dept_instance;

    function College ( address _student , address _department  ) {
        student = _student;
        dept_instance = Department(_department);
     }

    function chooseDept ( uint id ) payable returns (bool value) {
        bool ret = student.send(msg.value);
        if (!ret)
            return dept_instance.enroll(id, msg.sender);
        else
            throw;
    }
}
