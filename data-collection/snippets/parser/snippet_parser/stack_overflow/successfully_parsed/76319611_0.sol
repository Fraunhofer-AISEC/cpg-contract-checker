
pragma solidity >= 0.4.0 <0.9.0;

contract Scorecard{

    uint256 studentCount = 0;
    address public classTeacher;

    constructor() public {
        classTeacher = msg.sender;
    }

    modifier onlyClassTeacher(address _classTeacher) {
        require(classTeacher == _classTeacher, "Only the class teacher has access to this function");
        _;
    }

    struct StudentDetails{
        string studentFirstName;
        string studentLastName;
        uint256 id;
    }

    struct Score{
        uint256 studentId;
        uint256 englishMarks;
        uint256 mathMarks;
        uint256 scienceMarks;

    }

    mapping(uint => StudentDetails) students;

    mapping(uint => Score) scores;

    event studentAdded(string _studentFirstName, string _studentLastName, uint256 _studentId);

    event studentScoresRecorded(uint256 _studentId, uint256 _englishMarks, uint256 _mathMarks, uint256 _scienceMarks);

    function addStudentDetails (string memory _studentFirstName) public onlyClassTeacher(msg.sender){
        StudentDetails storage studentObj = students[studentCount];

        studentObj.studentFirstName = _studentFirstName;
        studentObj.studentLastName = _studentLastName;
        studentObj.id = studentCount;
        emit studentAdded(_studentFirstName, _studentLastName, msg.value, studentCount);
        studentCount++;
    }

    function addStudentScores(uint256 _studentId,
                              uint256 _englishMarks,
                              uint256 _mathMarks,
                              uint256 _scienceMarks ) public onlyClassTeacher(msg.sender){

        Score storage scoreObject = scores[_studentId];

        scoreObject.englishMarks = _englishMarks;
        scoreObject.mathMarks = _mathMarks;
        scoreObject.scienceMarks = _scienceMarks;
        scoreObject.studentId = _studentId;
        emit studentScoresRecorded(_studentId, _englishMarks, _mathMarks, _scienceMarks);
                              }
}