

pragma solidity >=0.7.0 <0.9.0;

contract CallCounter {

    uint256 callCounter = 0;

    function call() public {
        callCounter += 1;
    }

    
    function retrieve() public view returns (uint256){
        return callCounter;
    }
}
