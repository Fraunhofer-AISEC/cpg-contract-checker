pragma solidity ^0.5.5;
contract Test {
    constructor() public {
    }
    function rand() public view returns(uint,bytes32) {
        uint _previousBlockNumber;
        bytes32 _previousBlockHash;
        _previousBlockNumber = uint(block.number - 1);
        bytes32 _previousBlockHash = bytes32(blockhash(_previousBlockNumber)); 
        return (_previousBlockNumber,_previousBlockHash);
    }   
}
