function addQuestion(
uint _qid, 
string memory _question, 
string memory _answerOne, 
string memory _answerTwo, 
string memory _answerThree, 
string memory _answerFour, 
string memory _correctAnswer
) public isOwner {
    questions[_qid][_question] = Questions(Answers.push(_answerOne, _answerTwo, _answerThree, _answerFour), _correctAnswer);

}
