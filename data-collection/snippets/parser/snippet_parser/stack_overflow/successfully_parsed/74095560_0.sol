
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Test {
    struct CRPs {
        uint256 challenge;
        uint256 response;
    }

    mapping(address => CRPs) devChals;
    uint256 nonce;
    uint256 oldNonce;

    function nonceGen(uint256 randVal) private view returns (uint256) {
        return (uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, randVal))) % 281474976710654) + 1; 
    }

    function registerDevice(address addr, uint256 _challenge, uint256 _response) public returns(uint256, uint256) {
        if (devChals[addr].challenge == 0) {
            devChals[addr] = CRPs(_challenge, _response);
            
        }
        
        return (devChals[addr].challenge, devChals[addr].response);
    }

    function firstStage(address addr) public returns(uint256, uint256, string memory) {
        uint256 challenge = devChals[addr].challenge;
        uint256 response = devChals[addr].response;
        uint256 argVal = uint256(keccak256(abi.encodePacked(Strings.toString(challenge))));
        nonce = nonceGen(argVal);
        uint256 Mnode = response ^ nonce;
        bytes32 Hnode = keccak256(abi.encode(Strings.toString(challenge), Strings.toString(response), Strings.toString(nonce)));
        nonce = nonce+1;
        oldNonce = nonce;
        return (challenge, Mnode, toHex(Hnode));
    }
}
