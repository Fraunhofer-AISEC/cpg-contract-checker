pragma solidity ^0.4.0;

contract Getter_check {
   uint public data = 50;
   function f() constant returns (uint r)
   {
       r = data;
   }
}

pragma solidity ^0.4.0;

import "./Getter_check.sol";

contract Getter is Getter_check {
    function getval() constant returns(uint getter_value, uint r)
    {
        var obj = new Getter_check();
        getter_value = obj.data();
        r = obj.f();
    }
}
