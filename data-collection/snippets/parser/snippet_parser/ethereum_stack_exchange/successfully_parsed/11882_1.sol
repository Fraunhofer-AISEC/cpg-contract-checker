pragma solidity ^0.4.2;

contract Test {
    enum GameState {noWager, wagerMade, wagerAccepted}

    GameState public currentState;

    modifier onlyState(GameState expectedState) {
        if (expectedState != currentState) {
            throw;
        }
        _;
    }

    modifier onlyStates(GameState expectedState1, GameState expectedState2) {
        if (expectedState1 != currentState && expectedState2 != currentState) {
            throw;
        }
        _;
    }

    function testWager() onlyStates(GameState.noWager, GameState.wagerMade) payable returns (bool) {

    }
}
