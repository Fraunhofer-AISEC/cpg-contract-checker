

pragma solidity 0.8.14;

contract Surveys {

    struct Question {
        string question;
        string answer;
        string[] options;
    }

    struct Survey {
        address author;
        string title;
        string description;
        Question[] questions;
    }

    Survey[] private surveys;

    event CreateSurvey(Survey survey);

    function createSurvey(Survey calldata survey) public {
        require(msg.sender == survey.author, "can't ghost write");
        surveys.push(survey);
        emit CreateSurvey(survey);
    }

}
