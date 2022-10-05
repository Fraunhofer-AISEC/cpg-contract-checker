function answerQuestion(bytes32 _answer) notAnswered returns (string){
    if(_answer == keccak256(answer)){
        isAnswered = true;
        winner = msg.sender;
        return pos;
    }
    return "WRONG";
}
