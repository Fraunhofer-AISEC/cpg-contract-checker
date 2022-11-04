pragma solidity ^0.4.18;

contract M2M{

    function setvalues(uint a ,uint b) returns (uint){
        return a;
    }


    function caller() public returns (uint) {
      return  setvalues({b:90,a:45});
    }
}
