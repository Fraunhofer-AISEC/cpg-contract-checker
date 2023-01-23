pragma solidity ^0.4.15;

contract Str {

    event LogX(string thing);

    function x(string something) public returns(string success) {
        LogX(something);
        return something;
    }
}

contract Try {

    Str s;

    function Try(string that) {
        s = new Str();
        string set = s.x(that); 
    }
}
