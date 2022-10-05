pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;

contract MyContract {
    enum State{ A, B, C }

    State[] curState;
    State[][] myArray;

    uint i=0;

    constructor(uint Machines)public{
        for(i=0;i<Machines;i++){
            curState.push(State.A);
            myArray.push(curState);
        }
    }

    function historyOfStateMachine() public view returns (State[][]) {
        return myArray;
    }

}
