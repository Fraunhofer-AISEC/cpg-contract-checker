
pragma solidity >=0.8.0 <0.9.0;

import "./MyToken.sol";

contract Staking {
    MyToken public myToken;

    constructor(MyToken _myToken) public {
        myToken = _myToken;
    }

    function stake(uint256 _value) public {
        myToken.transferFrom(msg.sender, address(this), _value);
    }
}



