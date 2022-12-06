

pragma solidity ^0.7.1;

import "./WETH9.sol";

interface IWETH9 {
    function deposit() external payable;
}

contract Caller {
    IWETH9 public weth9;

    constructor(IWETH9 _weth9){
        weth9 = _weth9;
    }

    function call_deposit() public payable {     
        weth9.deposit{ value: 50 }();
        
    }
}
