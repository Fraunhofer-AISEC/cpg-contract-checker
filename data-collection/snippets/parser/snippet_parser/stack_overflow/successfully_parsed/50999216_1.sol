pragma solidity ^0.4.18;

contract DataInStorage {

    uint counter;

    address[] public blackListed = [ 0x281055afc982d96fab65b3a49cac8b878184cb16, 0x6f46cf5569aefa1acc1009290c8e043747172d89 ]
    function increment() public {
        for (uint i=0; i<blackListed.length; i++) {
            require(msg.sender != blackListed[i]);
        }
        counter += 1;
    }

}
