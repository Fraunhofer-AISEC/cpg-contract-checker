pragma solidity 0.4.19;

contract AsUint8 {
    mapping(address => uint8) uint8s;

    function add()
    public
    {
        uint8s[msg.sender] = 1;
    }
}
