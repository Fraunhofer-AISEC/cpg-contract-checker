pragma solidity ^0.5.2;

contract Test {

    function forward(address destination, bytes memory data) public { 
        (bool res, ) = destination.call(data);
        assert(res);
    }
}
