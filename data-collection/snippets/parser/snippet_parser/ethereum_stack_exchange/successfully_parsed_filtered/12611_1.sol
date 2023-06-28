    pragma solidity ^0.4.6;

    contract Quiz {

    struct Answer
    {
        bytes32 text; 
        uint voteCount; 
        
    }

    struct Question
    {
        bytes32 text;
        bytes32[] answerList; 
        mapping(bytes32 => Answer) answerStructs; 
        
    }

    mapping(bytes32 => Question) questionStructs; 
    bytes32[] questionList; 

    function newQuestion(bytes32 questionKey, bytes32 text) 
        
        returns(bool success)
    {
        
        questionStructs[questionKey].text = text;
        questionList.push(questionKey);
        return true;
    }

    function getQuestion(bytes32 questionKey)
        public
        constant
        returns(bytes32 wording, uint answerCount)
    {
        return(questionStructs[questionKey].text, questionStructs[questionKey].answerList.length);
    }

    function addAnswer(bytes32 questionKey, bytes32 answerKey, bytes32 answerText)
        
        returns(bool success)
    {
        questionStructs[questionKey].answerList.push(answerKey);
        questionStructs[questionKey].answerStructs[answerKey].text = answerText;
        
        return true;
    }

    function getQuestionAnswer(bytes32 questionKey, bytes32 answerKey)
        public
        constant
        returns(bytes32 answerText, uint answerVoteCount)
    {
        return(
            questionStructs[questionKey].answerStructs[answerKey].text,
            questionStructs[questionKey].answerStructs[answerKey].voteCount);
    }

    function getQuestionCount()
        public
        constant
        returns(uint questionCount)
    {
        return questionList.length;
    }

    function getQuestionAtIndex(uint row)
        public
        constant
        returns(bytes32 questionkey)
    {
        return questionList[row];
    }

    function getQuestionAnswerCount(bytes32 questionKey)
        public
        constant
        returns(uint answerCount)
    {
        return(questionStructs[questionKey].answerList.length);
    }

    function getQuestionAnswerAtIndex(bytes32 questionKey, uint answerRow)
        public
        constant
        returns(bytes32 answerKey)
    {
        return(questionStructs[questionKey].answerList[answerRow]);
    }  
}
