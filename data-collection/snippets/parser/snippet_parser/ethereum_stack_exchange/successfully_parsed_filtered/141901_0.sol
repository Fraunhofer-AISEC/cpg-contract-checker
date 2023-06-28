


pragma solidity ^0.8.0;


contract Exam {
    
    address public administrator;

    
    mapping(uint => string) public questions;
    mapping(uint => string) public answers;

    
    mapping(address => Submission) public submissions;

    
    uint public numQuestions;

    
    uint public passingScore;

    
    uint public maxAttempts;

    
    bool public isOpen;

    
    struct Submission {
        uint[] answers;
        uint score;
        uint numAttempts;
    }

    constructor(uint _numQuestions, uint _passingScore, uint _maxAttempts) public {
        administrator = msg.sender;
        numQuestions = _numQuestions;
        passingScore = _passingScore;
        maxAttempts = _maxAttempts;
        isOpen = true;
    }

    
    function addQuestion(uint _questionNumber, string memory _question, string memory _answer) public {
        require(msg.sender == administrator, "Only the administrator can add questions to the exam.");
        require(_questionNumber > 0 && _questionNumber <= numQuestions, "Invalid question number.");
        require(questions[_questionNumber] == bytes32(0), "Question has already been added.");

        questions[_questionNumber] = _question;
        answers[_questionNumber] = _answer;
    }

    
    function submitAnswers(uint[] memory _answers) public {
        require(isOpen, "Exam is closed.");
        require(_answers.length == numQuestions, "Incorrect number of answers.");

        address user = msg.sender;
        Submission storage submission = submissions[user];
        submission.numAttempts++;

        require(submission.numAttempts <= maxAttempts, "Exceeded maximum number of attempts.");

        
        submission.score = 0;
        for (uint i = 0; i < numQuestions; i++) {
            if (_answers[i] == uint(answers[i])) {
 {
                submission.score++;
            }
        }

        
        submission.answers = _answers;
    }}

    
   function getScore() public view returns (uint) {
        address user = msg.sender;
        return submissions[user].score;
    }

    
    function closeExam() public {
        require(msg.sender == administrator, "Only the administrator can close the exam.");
        isOpen = false;
    }
}
