pragma solidity ^0.5.3;

contract test3 {       
    address watch_addr = address(0x1245689);
    function register(string memory _text) public {
        watch_addr.call(abi.encodeWithSignature("register(string)", _text));
    }
}
