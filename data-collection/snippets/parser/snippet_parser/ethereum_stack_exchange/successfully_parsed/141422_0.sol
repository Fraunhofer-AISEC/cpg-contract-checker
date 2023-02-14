function addAnswer(address _user, uint16 _id, string memory _answer) public {
    Question[] storage ques = user_questions[_user];
    ques[_id].answer = _answer;
}
