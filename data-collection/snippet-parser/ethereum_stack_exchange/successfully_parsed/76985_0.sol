pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Betting {

    struct Bet{
        uint betId;
        string question;
        mapping(uint => MoneyLineData) moneyLineData;
        uint lengthMoneyLineData;
    }

    struct MoneyLineData{
        string option;
        int value; 
    }

    mapping(uint => Bet) public bets;
    uint public lengthBets = 0;

    constructor() public{
        MoneyLineData[2] memory moneyLineData = [MoneyLineData("Gator", 200), MoneyLineData("Miami", -100)];
        Bet memory bet;
        bet.betId = 1;
        bet.question = "Gator vs Miami";
        bet.lengthMoneyLineData = 0;
        bet.moneyLineData[bet.lengthMoneyLineData] = moneyLineData[0];
        bet.moneyLineData[bet.lengthMoneyLineData] = moneyLineData[1];
        bet.lengthMoneyLineData += moneyLineData.length;
        bets[lengthBets] = bet;
        lengthBets += 1;
    }
}

