pragma solidity ^0.4.18;

contract DataStore
{
    function stringToBytes32(string memory source) returns (bytes32 result) {
        assembly {
            result := mload(add(source, 32))
        }
    }

    function DataStore()
    {
    }

    function str_to_bytes(string str) constant returns (byte[64]){
        bytes memory b = bytes(str);
        byte[64] final_str;
        for(uint i; i<b.length; i++){
            final_str[i] = b[i];
        }

        return final_str;
    }

    function getValue() public returns (byte[64])
    {
        return str_to_bytes("sasdasdasdasdasdasd");
    }
}
