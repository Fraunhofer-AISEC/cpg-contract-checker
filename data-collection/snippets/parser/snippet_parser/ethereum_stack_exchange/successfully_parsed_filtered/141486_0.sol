pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract CoinFlip {
   using SafeMath for uint;
   address public owner;
   uint public balance;
   uint public betLimit;
   uint public totalBets;
   uint public totalPayouts;

constructor(uint _betLimit) public {
    owner = msg.sender;
    balance = 0;
    betLimit = _betLimit;
    totalBets = 0;
    totalPayouts = 0;
}

function flipCoin(uint _bet) public payable {
    require(_bet > 0, "You must bet some Ether to play");
    require(_bet <= betLimit, "The bet must be less than or equal to the bet limit");

    totalBets = totalBets.add(_bet);
    balance = balance.add(_bet);

    uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 2;
    if (randomNumber == 0) {
        address(msg.sender).transfer(_bet.mul(2));
        balance = balance.sub(_bet.mul(2));
        totalPayouts = totalPayouts.add(_bet.mul(2));
    }
}

function disable() public {
    require(msg.sender == owner, "Only the owner can disable the contract");
    selfdestruct(owner);
}
}
