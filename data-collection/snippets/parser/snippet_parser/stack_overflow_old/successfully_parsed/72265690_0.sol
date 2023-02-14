pragma solidity ^0.8.13;

import "https://github.com/bancorprotocol/contracts-v3/blob/master/contracts/network/interfaces/IBancorNetwork.sol";

contract Trying{
    IERC20 public dai;
    IBancorNetwork public bancor;

    constructor(){
        dai = IERC20(0xaD6D458402F60fD3Bd25163575031ACDce07538D);
        bancor = IBancorNetwork(0xeEF417e1D5CC832e619ae18D2F140De2999dD4fB);
    }
    function supply(uint256 _amount) external{
        dai.transferFrom(msg.sender, address(this), _amount);
        dai.approve(0xeEF417e1D5CC832e619ae18D2F140De2999dD4fB, _amount);
        bancor.deposit(address(dai), _amount);
    }
}
