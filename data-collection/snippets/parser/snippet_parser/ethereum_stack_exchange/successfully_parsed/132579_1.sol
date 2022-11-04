uint8 public answerHashed;

function settle(IPredict _address) public payable {
        uint8 answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))) % 10;
        if (myGuess == answer) {
            _address.settle();
        }
        else {
            answerHashed = answer;
        }
}
