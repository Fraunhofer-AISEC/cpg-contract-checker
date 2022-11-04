
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
        string correctAnswer;
    }

    struct Students {
        string Name;
        address StudentAddress;
    }
    


    mapping(uint => Questions) public students;
    mapping(uint => mapping(string => Questions)) public questions;

    function addStudent(uint _id, address _studentAddress, string memory _studentName) public isOwner {
        students[_id] = Students(_studentName, _studentAddress);
    }


    function addQuestion(uint _qid, string memory _question, string memory _answerOne, string memory _answerTwo, string memory _answerThree, string memory _answerFour, string memory _correctAnswer) public isOwner {
        questions[_qid][_question] = Questions(Answers.push(_answerOne, _answerTwo, _answerThree, _answerFour), _correctAnswer);

    }

}

