pragma solidity 0.4.24;

contract Percent {

    function getPercent(uint part, uint whole) public pure returns(uint percent) {
        uint numerator = part * 1000;
        require(numerator > part); 
        uint temp = numerator / whole + 5; 
        return temp / 10;
    }
}
