pragma solidity 0.5.1;

import "./HitchensUnorderedKeySet.sol";

contract KeyAKeyB {

    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;

    
    mapping(bytes32 => HitchensUnorderedKeySetLib.Set) bInA;

    
    mapping(bytes32 => HitchensUnorderedKeySetLib.Set) aInB;

    
    mapping(bytes32 => bytes32) public values;

    event LogSet(bytes32 keyA, bytes32 keyB, bytes32 value);
    event LogRem(bytes32 keyA, bytes32 keyB);

    function multikey(bytes32 keyA, bytes32 keyB) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(keyA, keyB));
    }

    
    

    function set(bytes32 keyA, bytes32 keyB, bytes32 value) public {
        if(!isBInA(keyA, keyB)) bInA[keyA].insert(keyB); 
        if(!isAInB(keyA, keyB)) aInB[keyB].insert(keyB); 
        values[multikey(keyA, keyB)] = value;
        emit LogSet(keyA, keyB, value);
    }

    function get(bytes32 keyA, bytes32 keyB) public view returns(bytes32 value) {
        
        
        return values[multikey(keyA, keyB)];
    }

    

    function remove(bytes32 keyA, bytes32 keyB) public {
        bInA[keyA].remove(keyB);
        aInB[keyB].remove(keyA);
        delete values[multikey(keyA, keyB)];
        emit LogRem(keyA, keyB);
    }

    

    function isBInA(bytes32 keyA, bytes32 keyB) public view returns(bool isIndeed) {
        return bInA[keyA].exists(keyB);
    }

    function isAInB(bytes32 keyA, bytes32 keyB) public view returns(bool isIndeed) {
        return aInB[keyB].exists(keyA);
    }

    

    function countBinA(bytes32 keyA) public view returns(uint) {
        return bInA[keyA].count();
    }

    function countAinB(bytes32 keyB) public view returns(uint) {
        return aInB[keyB].count();
    }

    function aBAtIndex(bytes32 keyA, uint row) public view returns(bytes32 keyB) {
        return bInA[keyA].keyAtIndex(row);
    }

    function bAAtIndex(bytes32 keyB, uint row) public view returns(bytes32 keyA) {
        return aInB[keyB].keyAtIndex(row);
    }
}
