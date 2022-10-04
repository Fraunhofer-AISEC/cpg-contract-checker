pragma solidity ^0.4.19;

contract Called{

    string public name;

    function set(string _var) {
        name = _var;
    }

    function   get() view returns (string){
        return name;
    }


    function A () payable {

    }



}
