pragma solidity ^0.4.2;

contract parent{
    string public name;
    function parent(string _name){
        name=_name;
    }
}

contract child is parent{}
