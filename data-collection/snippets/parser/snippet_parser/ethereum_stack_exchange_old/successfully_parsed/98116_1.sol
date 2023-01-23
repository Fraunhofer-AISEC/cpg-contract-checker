pragma solidity ^0.8.1;


contract MyContract {

    string value;
    
    function get() public view returns(string memory) {
        return value;
    }
}
