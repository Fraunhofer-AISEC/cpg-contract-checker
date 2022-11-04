pragma solidity ^0.4.0;

contract owned {
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}

contract Roadshow is owned {

    bytes32 public text;  
    uint public start; 
    uint public end;   
    mapping(address => Voter) public voters;

    struct Voter {
        bool enabled;  
    }

    struct Answer
    {
        bytes32 text;
        uint voteCount; 
        
    }

    struct Question
    {
        bytes32 text;
        mapping(bytes32 => Answer) answers; 
        bytes32[] answerList; 
        
        mapping(address => bool) alreadyVoted;
      }

    mapping(bytes32 => Question) questions; 
    bytes32[] questionList; 

    function Roadshow(bytes32 _name) {
        text = _name;
        start = now;
        voters[msg.sender].enabled = true;
    }

    function addQuestion(bytes32 questionKey, bytes32 text)
        onlyOwner
        returns(bool success)
    {
        
        questions[questionKey].text = text;
        questionList.push(questionKey);
        return true;
    }

    function getQuestion(bytes32 questionKey)
        public
        constant
        returns(bytes32 wording, uint answerCount)
    {
        return(
            questions[questionKey].text,
            questions[questionKey].answerList.length);
    }

    function addAnswer(bytes32 questionKey, bytes32 answerKey, bytes32 answerText)
        onlyOwner
        returns(bool success)
    {
        questions[questionKey].answerList.push(answerKey);
        questions[questionKey].answers[answerKey].text = answerText;
        
        

        return true;
    }

    function getQuestionAnswer(bytes32 questionKey, bytes32 answerKey)
        public
        constant
        returns(bytes32 answerText, uint answerVoteCount)
    {
        return(
            questions[questionKey].answers[answerKey].text,
            questions[questionKey].answers[answerKey].voteCount);
    }

    function getQuestionAnswerText(bytes32 questionKey, bytes32 answerKey)
        public
        constant
        returns(bytes32 answerText)
    {
        answerText = questions[questionKey].answers[answerKey].text;

        return answerText;
    }

    function getQuestionAnswerCount(bytes32 questionKey, bytes32 answerKey)
        public
        constant
        returns(uint answerCount)
    {
        answerCount = questions[questionKey].answers[answerKey].voteCount;

        return answerCount;
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
        return(questions[questionKey].answerList.length);
    }

    function getQuestionAnswerAtIndex(bytes32 questionKey, uint answerRow)
        public
        constant
        returns(bytes32 answerKey)
    {
        return(questions[questionKey].answerList[answerRow]);
    }

    
    
    function voteForAnswer(bytes32 questionKey, bytes32 answerKey)
         returns (bool success)
    {
        
        if (voters[msg.sender].enabled == false) {
            throw;
        }
        
        if (questions[questionKey].alreadyVoted[msg.sender] == true) {
            throw;
        }

        questions[questionKey].alreadyVoted[msg.sender] = true;
        questions[questionKey].answers[answerKey].voteCount += 1;
        VoterVotedFor(msg.sender, questionKey, answerKey);

        return true;
    }

    function addVoter(address _voter)
        onlyOwner
        returns (bool success)
    {
        voters[_voter] = Voter(true);
        VoterAdded(_voter, this.text());
        return true;
    }

    event VoterAdded(address _newVoter, bytes32 _questionKey);
    event VoterVotedFor(address _voter, bytes32 _questionKey, bytes32 _answerKey);
}
