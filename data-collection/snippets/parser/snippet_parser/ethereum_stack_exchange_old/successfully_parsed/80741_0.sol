pragma solidity 0.5.9;
contract test{


address payable owner;
mapping (address => bool) pd;
uint public sS;
function lnA(address addr) public view returns(uint n) {
        
        n = uint(keccak256(uint(addr), sS)[0]) % 8;

    }
}
