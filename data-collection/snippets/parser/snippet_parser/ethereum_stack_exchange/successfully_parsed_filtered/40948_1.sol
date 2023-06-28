contract CollegeAdmin {
    uint8 public studentAge=21;
    uint16 public studentIncome=15000;
    uint8 public studentScore=4;

    uint8 public studentAttendance=96;

    function testReturn() returns (uint) {
        studentAge=90;
        return 89;
    }
}
