pragma solidity ^0.4.24;

contract setget{
    uint x;
    function setnumber(uint _x) public {
        x=_x;
    }
    function getnumber() public view returns(uint){
        return x;
    }
}
