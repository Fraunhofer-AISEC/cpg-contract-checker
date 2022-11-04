pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import './MyToken.sol';

contract test1 {

    
    MyToken isMyToken;

    
    constructor(MyToken _myToken) public {

        isMyToken = _myToken;

    }


}
