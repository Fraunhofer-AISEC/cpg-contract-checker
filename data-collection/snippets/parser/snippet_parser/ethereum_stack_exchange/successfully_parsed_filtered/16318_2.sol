pragma solidity ^0.4.2;

contract parent {

    bytes32 public name;

    function parent(bytes32 _name){
        name=_name;
    }
}


contract child is parent {

    function child(bytes32 _name) parent(_name) {}

}
