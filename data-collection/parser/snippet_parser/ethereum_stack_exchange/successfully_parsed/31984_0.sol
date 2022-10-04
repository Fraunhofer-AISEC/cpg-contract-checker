pragma solidity ^0.4.4;

contract c {
    string test;

    function setter(string _s) {
        test = _s;
    }

    function  getTest() constant returns(string) {
        return(test);
    }
}
