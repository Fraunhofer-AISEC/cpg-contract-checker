pragma solidity >=0.7.0 <0.9.0;

contract AbiEncode {

    function encodeUint16(uint16 _uint16) public pure returns (bytes memory){
        
        return abi.encode(_uint16);
    }

    function encodeInt16(int16 _int16) public pure returns (bytes memory){
        
        return abi.encode(_int16);
    }

    function encodeAddress(address _address) public pure returns (bytes memory){
        
        return abi.encode(_address);
    }

    function encodeBool(bool _bool) public pure returns (bytes memory){
        
        return abi.encode(_bool);
    }    
}
