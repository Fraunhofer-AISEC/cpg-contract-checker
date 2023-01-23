pragma solidity ^0.4.19;

interface Called{

    function set(string);

    function get() view returns (string);
}

contract Caller {

    string public new_name;

    Called public called_address;

    function set_address(address _addy) {
        called_address = Called(_addy);
    }

    function caller_set(string _var) {

        called_address.set(_var);
    } 
    function caller_get() {
        new_name= called_address.get();

    }


    function B () payable {

    }


}
