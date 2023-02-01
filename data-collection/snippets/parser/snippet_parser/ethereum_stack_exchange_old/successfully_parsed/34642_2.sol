pragma solidity 0.4.19;

contract AsBool {
    mapping(address => bool) bools;

    function add()
    public
    {
        bools[msg.sender] = true;
    }
}
