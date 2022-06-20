SomeStruct public rr;

function getRatingResult() public constant returns(bytes32) {
    
    return rr.winningContestantId;
}
