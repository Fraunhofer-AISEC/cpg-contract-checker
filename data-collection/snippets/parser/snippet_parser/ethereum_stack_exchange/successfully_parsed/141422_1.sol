function addQuestion(address _user, Question storage question) public returns (uint16) {
    user_questions[_user].push(question);

    
    return user_questions[_user].length - 1;
}
