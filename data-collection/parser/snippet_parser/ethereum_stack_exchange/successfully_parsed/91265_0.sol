pragma solidity 0.8.0;

contract a {
    uint256 numberA = 5;
    string operator = "+";
    uint256 numberB = 6;

    function add() external view returns(string memory)
    {
        return(numberA + operator + numberB);
    }
}
