pragma ton-solidity ^0.51.0;

interface IPing {
    function onGet(uint b) external;
}

contract Pong {
    function get(uint b) external {       
        IPing(msg.sender).onGet(b + 1);        
    }
}
