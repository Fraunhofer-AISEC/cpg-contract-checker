pragma solidity 0.5.9;
contract test{
    

    address payable owner;
    mapping (address => bool) pd;
    uint public sS;

    function lnA(address addr) public view returns(uint8 n) {
        
        n = uint8(keccak256(abi.encodePacked(addr, sS))[0]) % 8;
    }
}
