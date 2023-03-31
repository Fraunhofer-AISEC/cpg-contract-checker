pragma solidity ^0.8.0;

contract bank {
    uint256 public amountIn;
    function deposit() external payable returns(uint256) {
        amountIn = msg.value ;
        return amountIn;
    }
}
