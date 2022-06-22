pragma solidity 0.4.25;
pragma experimental ABIEncoderV2;

contract Example {
    struct Sample {
        bytes32 key;
        string str1;
        .
        .
        .
        .
        .
        string str8;
        byts32[] someArray; 
    }

    mapping(bytes32 => Sample) sampleMap;

    function set(Sample data) public returns(bool) {
        sampleMap[data.key] = data;
        return true;
    }

    function get(bytes32 key) returns(Sample) {
        return sampleMap[key];
    }
}
