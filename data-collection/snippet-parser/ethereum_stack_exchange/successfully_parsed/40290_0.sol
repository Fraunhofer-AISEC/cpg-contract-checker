pragma solidity ^0.4.20;
import "./oraclize.sol";

contract Casino is usingOraclize {
   address owner;
   uint public betAmount = 30 finney; 
   uint public totalBets; 
   uint public numberOfBets; 
   
   uint public limitAmountOfBets = 3; 
   uint public numberWinner; 
   bool public gameStatus;
   uint public stage = 0;
   mapping(uint => address[]) numberBetPlayers; 
   mapping(address => uint) playerBetsNumber; 

   modifier onEndGame() {
       if(numberOfBets >= limitAmountOfBets) _;
   }

   
   function Casino(uint _betAmount, uint _limitAmountOfBets) {
       owner = msg.sender; 

       if(_betAmount > 0) betAmount = _betAmount;
       if(_limitAmountOfBets > 0) limitAmountOfBets = _limitAmountOfBets;

       oraclize_setProof(proofType_Ledger); 
   }

   
   function checkPlayerExists(address player) constant public returns(bool) {
       if(playerBetsNumber[player] > 0) return true;
       else return false;
   }

   
   function bet(uint numberToBet) payable {
       require(numberOfBets <= limitAmountOfBets); 
       require(!checkPlayerExists(msg.sender)); 
       require(numberToBet >=1 && numberToBet <= 10); 
       require(msg.value == betAmount); 
       gameStatus = true;

       playerBetsNumber[msg.sender] = numberToBet;
       numberBetPlayers[numberToBet].push(msg.sender);

       numberOfBets += 1;
       totalBets += msg.value;

       if(numberOfBets >= limitAmountOfBets) generateNumberWinner();
   }

   
   function generateNumberWinner() payable onEndGame {
       gameStatus = false;
       stage = 1;
       uint numberRandomBytes = 7;
       uint delay = 0;
       uint callbackGas = 200000;

       oraclize_newRandomDSQuery(delay, numberRandomBytes, callbackGas);
   }

   function __callback(bytes32 _queryId, string _result, bytes _proof) {
       stage = 2;
       require(msg.sender == oraclize_cbAddress());
       if(oraclize_randomDS_proofVerify__returnCode(_queryId, _result, _proof) != 0) { throw; }
       else {
           numberWinner = (uint(keccak256(_result))%10+1);
           distributePrizes();
       }
   }

   function distributePrizes() internal onEndGame {
       stage = 3;
       uint winnerEtherAmount = totalBets / numberBetPlayers[numberWinner].length; 

       for(uint i = 0; i < numberBetPlayers[numberWinner].length; i++) { 
           numberBetPlayers[numberWinner][i].transfer(winnerEtherAmount);
       }

       for(uint j = 1; j <= 10; j++) {
           numberBetPlayers[j].length = 0;
       }

       totalBets = 0;
       numberOfBets = 0;
   }
}
