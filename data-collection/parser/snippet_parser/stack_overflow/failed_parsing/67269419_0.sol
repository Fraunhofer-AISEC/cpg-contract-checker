modifier requireAnyOfStates(State[2] memory _states) {
    require(_states[0] == state || _states[1] == state);
    _;
}
    
function foo() external requireAnyOfStates([State.VALID, State.TERMINATED]) {
}
