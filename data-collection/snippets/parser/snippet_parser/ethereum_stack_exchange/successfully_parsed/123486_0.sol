pragma solidity ^0.8.10;


interface ICounter {
    function balanceOf(address owner) external view returns (uint);
    function transfer(address to, uint value) external view returns (bool);
    function balances(address owner) external returns (uint);
}

contract MyContract {
    uint public theBalance;
    function incrementCounter(address _counter,uint value) external {
        theBalance = ICounter(_counter).balances(msg.sender);
        theBalance = value;
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).balanceOf(msg.sender);
    }

}
