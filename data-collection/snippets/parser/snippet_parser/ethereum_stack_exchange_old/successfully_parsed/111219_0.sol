pragma solidity ^0.7.6;

contract EtherCoinFlip {
    uint256 etherWinnings;

    struct EtherCoinFlipStruct {
        address payable betStarter;
        uint256 startingWager;
        address payable betEnder;
        uint256 endingWager;
        uint256 etherTotal;
        address payable winner;
        address payable loser;
    }

uint256 numCoinFlips = 300;
mapping(uint256 => EtherCoinFlipStruct) EtherCoinFlipStructs;


event EtherCoinFlipped(uint256 indexed theCoinFlipID);


function newPureCoinFlip() public payable returns (uint256 coinFlipID) {
    coinFlipID = numCoinFlips++;
    EtherCoinFlipStructs[coinFlipID] = EtherCoinFlipStruct(
        msg.sender, 
        msg.value, 
        msg.sender, 
        msg.value, 
        0, 
        msg.sender, 
        msg.sender 
    );
    emit EtherCoinFlipped(coinFlipID);
}

event EtherCoinFinishedFlip(address indexed winner);


function endPureCoinFlip(uint256 coinFlipID)
    public
    payable
{
    require(coinFlipID == coinFlipID);
    EtherCoinFlipStruct memory c = EtherCoinFlipStructs[coinFlipID];
    c.betEnder = msg.sender;
    c.endingWager = msg.value;
    c.etherTotal = c.startingWager + c.endingWager;

    uint256 finalVerdict = block.number +
        block.timestamp +
        msg.value +
        block.difficulty +
        block.gaslimit +
        tx.gasprice +
        1;

    if ((finalVerdict % 2) == 0) {
        c.winner = c.betStarter;
    } else {
        c.winner = c.betEnder;
    }

    c.winner.transfer(c.etherTotal);

    emit EtherCoinFinishedFlip(c.winner);
}
}