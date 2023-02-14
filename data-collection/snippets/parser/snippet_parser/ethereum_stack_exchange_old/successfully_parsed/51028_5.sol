    pragma solidity ^0.4.23;

import "./ArrayTes.sol";

contract CallFunction {

    address public useraddress;
    constructor(address _t) public {

        useraddress = _t;
    }

    function thirdfun(uint256 a) public view returns(uint256 c) {

        ArrayTes instanceuser = ArrayTes(useraddress);
        c = instanceuser.secfun(a);
        return c;
    }

}
