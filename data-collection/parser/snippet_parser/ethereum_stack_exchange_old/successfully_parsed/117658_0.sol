pragma solidity ^0.8.0;

contract Voting {
    struct Question {
        uint256 questionId;
        Option[] options;
    }

    struct Option {
        uint256 optionId;
        string optionValue;
    }

    
    mapping(uint256 => Question) public mapQuestions;

    function addQuestion(string memory _option1) public {
        Question memory quest;
        quest.questionId = 1;
        quest.options[0] = Option(1, _option1);

        mapQuestions[quest.questionId] = quest;
    }
}
