pragma solidity ^0.4.2;        
contract A {
    address owner;
    function A() {
        owner = msg.sender;
    }
    function destroy() {
        selfdestruct(owner);
    }
}

contract B{ 
    function call(address a) {
        a.delegatecall(bytes4(sha3("destroy()"))); 
    }
}
