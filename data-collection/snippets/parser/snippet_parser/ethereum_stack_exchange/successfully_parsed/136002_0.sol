pragma solidity >=0.5.0 <0.6.0;

contract MyContract{
    string value;

    function get() public returns(string memory){

        return value;
    } 
}
