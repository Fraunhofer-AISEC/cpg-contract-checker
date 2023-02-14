pragma solidity ^0.5.1;

contract test3 {       
    address watch_addr = address(0x1234567963); 

    function balanceOf(address owner) public {
        watch_addr.call(abi.encodeWithSignature("balanceOf(address)", owner));
        return balanceOf(owner);
    }
}
