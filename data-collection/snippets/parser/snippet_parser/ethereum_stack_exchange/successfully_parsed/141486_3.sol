
function flipCoin() public payable {
    require(msg.value > 0, "You must bet some Ether to play");
    require(msg.value <= betLimit, "The bet must be less than or equal to the bet limit");

    totalBets = totalBets + _bet;


    uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 2;
    if (randomNumber == 0) {
        payable(msg.sender).transfer(msg.value * 2);
        
        totalPayouts = totalPayouts + (_bet * 2);
    }
}
