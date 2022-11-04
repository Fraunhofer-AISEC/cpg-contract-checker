pragma solidity ^0.4.0;

contract Getter {
   function GetGameScore(string name) returns(int) {
   }
}

pragma solidity ^0.4.0;

import "./Getter.sol";

contract Getter_check {
    function showScore(string name) returns(int) {
        var obj=   new Getter();
        return obj.GetGameScore(name);
    }
}
