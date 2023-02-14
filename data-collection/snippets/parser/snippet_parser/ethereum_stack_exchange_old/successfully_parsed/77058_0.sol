pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Betting {

    struct Bet{
        uint betId;
        string question;
        BetStatus betStatus;
        mapping(uint => MoneyLineDatum) moneyLineData;
        uint lengthMoneyLineData;
    }

    struct MoneyLineDatum{
        string option;
        int value; 
    }

    address public owner = msg.sender;

    mapping(uint => Bet) public bets;
    uint public lengthBets;
    enum BetStatus {Open, Closed}

    constructor() public{
        string[2] memory options = ["Gator", "Miami"];
        int[2] memory values = [int(200), -100];
        addBet("Gator vs Miami", options, values);

        options = ["Gator", "Georgia"];
        values = [int(200), -150];
        addBet("Gator vs Georgia", options, values);
    }

    modifier onlyBy(address account){
        require(msg.sender == account, "Unauthorised Access");
        _;
    }

    function addNewEmptyBet() public{
        Bet memory bet;
        bets[lengthBets] = bet;
    }

    function addBet(string memory question, string[2] memory options, int[2] memory values) public onlyBy(owner){
        addNewEmptyBet();
        Bet storage bet = bets[lengthBets];
        bet.betId = lengthBets;
        bet.question = question;
        bet.betStatus = BetStatus.Open;
        lengthBets+=1;
        for(uint i=0; i<options.length; i++){
            bet.moneyLineData[i] = MoneyLineDatum(options[i], values[i]);
        }
        bet.lengthMoneyLineData+=options.length;
    }

    function getLengthMoneyLineData(uint betId) public view returns(uint){
        return bets[betId].lengthMoneyLineData;
    }

    function getMoneyLineData(uint betId, uint idx) public view returns(string memory, int){
        MoneyLineDatum storage moneyLineDatum = bets[betId].moneyLineData[idx];
        return (moneyLineDatum.option, moneyLineDatum.value);
    }
}
