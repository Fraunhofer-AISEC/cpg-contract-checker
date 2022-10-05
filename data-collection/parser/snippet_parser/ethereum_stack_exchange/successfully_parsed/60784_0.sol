function accept() public onlyState(State.created) payable returns (bool) {
    player2 = msg.sender;
    currentState = State.accepted;
    return true;
}

function close() internal onlyState(GameState.accepted) returns (bool) {
        currentState = State.over;
        return true;   
}
