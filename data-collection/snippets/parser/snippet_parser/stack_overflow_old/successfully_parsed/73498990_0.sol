    pragma solidity ^0.8.0;
contract ABC{
    uint max = 3;
    uint[] numbers;
    mapping(uint => bool) isNFTWon;
    function drawNumbers() public returns (uint256[] memory) {
        for(uint i=0; i<max; i++){
            uint Ids = uint (keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % 1000;
            if(isNFTWon[Ids] == true){
                i -= 1;
                continue;
            }
            isNFTWon[Ids] = true;
            numbers.push(Ids);
        }
        return numbers;
    }
}
