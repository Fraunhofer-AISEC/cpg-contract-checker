pragma solidity ^0.4.24;

interface ITest {
    function balance() external returns (address);
}

contract Test is ITest {
    address public balance;

    
    function balance() public returns (address) {
        return balance;
    }
}
