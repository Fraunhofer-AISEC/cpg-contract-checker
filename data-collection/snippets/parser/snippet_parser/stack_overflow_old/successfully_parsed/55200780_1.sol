pragma solidity ^0.5.5;
contract Test {
    uint256 i;
    constructor() public {
    }
    function rand() public view returns(uint,bytes32) {
        uint _previousBlockNumber;
        bytes32 _previousBlockHash;
        _previousBlockNumber = uint(block.number - 1);
        _previousBlockHash = bytes32(blockhash(_previousBlockNumber)); 
        return (_previousBlockNumber,_previousBlockHash);
    }  

    function setI(uint256 k) public{
        i = k;
    }
}
