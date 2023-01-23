function addQuestion(uint _qid, string memory _question, string memory 
_answerOne, string memory _answerTwo, string memory _answerThree, string memory 
_answerFour, string memory _correctAnswer) public isOwner {
        string[] storage _answers;
        _answers.push(_answerOne);
        _answers.push(_answerTwo);
        _answers.push(_answerThree);
        _answers.push(_answerFour);
        questions[_qid][_question] = Questions(_answers, _correctAnswer);
    }
