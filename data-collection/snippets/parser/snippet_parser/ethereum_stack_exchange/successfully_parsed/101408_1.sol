

pragma solidity >=0.4.22 <0.9.0;

import "./Parent.sol";

contract Child is Parent{
    uint time;

    constructor (
        string memory contractName,
        uint targetAmountEth,
        uint durationInMin,
        address beneficiaryAddress
    )
        Parent(contractName, targetAmountEth, durationInMin, beneficiaryAddress)
    {
        
    }

 

    function currentTime() internal view override returns (uint) {
        return time;
    }

    function setCurrentTime(uint newTime) public {
        time = newTime;
    }
}
