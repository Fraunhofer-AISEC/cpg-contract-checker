pragma solidity ^0.8.7;

contract MyContract {
    
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    function deposit() public payable {
        owner.transfer(msg.value);
    }

    struct Questions {
        string[] Answers;
        uint correctAnswer;
    }

    struct AnswersStruct {
        string[] sAnswers;
    }

    struct Students {
        string Name;
        address StudentAddress;
    }
    
    address[] studentsArray;

    mapping(uint => mapping(string => address)) public students;
    mapping(uint => address) public studentsAddresses;
    mapping(address => uint) public studentsIds;
    mapping(uint => mapping(string => Questions)) public questions;
    mapping(uint => string) public idQuestions;
    mapping(uint => string[]) public questionAnswers;
    mapping(uint => uint) public correctAnswerMapping;
    
    
    function addStudent(uint _id, address _studentAddress, string memory _studentName) public isOwner {
        students[_id][_studentName] = _studentAddress;
        studentsAddresses[_id] = _studentAddress;
        studentsArray.push(_studentAddress);
    }

    
    function addQuestion(uint _qid, string memory _question, string memory _answerOne, string memory _answerTwo, string memory _answerThree, string memory _answerFour, uint _correctAnswer) public isOwner {
        Questions storage _q = questions[_qid][_question];
        _q.Answers = [_answerOne, _answerTwo, _answerThree, _answerFour];
        _q.correctAnswer = _correctAnswer;
        idQuestions[_qid] = _question;
        questionAnswers[_qid] = [_answerOne, _answerTwo, _answerThree, _answerFour];
        correctAnswerMapping[_qid] = _correctAnswer;
    }


    
    function fetchQuestion(uint _qid) public view returns (string memory) {
        string memory veribeel;
        veribeel = idQuestions[_qid];
        return veribeel;
        
    }

    
    function fetchAnswers(uint _id) public view returns (string[] memory) {
        string memory veribeel;
        string[] memory allAnswers;
        veribeel = idQuestions[_id];
        allAnswers = questionAnswers[_id];
        return allAnswers;
    }

    
    function answerQuestion(uint _id, uint _studentAnswer) public view returns (bool) {
        uint studentAnswer = correctAnswerMapping[_id];
        if (_studentAnswer == studentAnswer) {
            return true;
        }   else {
            return false;
        }
    }

    function isThisAddressStudent(address _studentAddress) public view returns (bool) {
        for(uint i; i < studentsArray.length; i++) {
            if(studentsArray[i] == _studentAddress) {
                return true;
            } else {
                return false;
            }
            }
    }
        
       

   



}
