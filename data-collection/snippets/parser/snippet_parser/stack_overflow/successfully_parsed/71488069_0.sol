pragma solidity ^0.8.4;
import "./Token.sol"; 
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Lottery is Ownable {

Token token;
constructor(Token _token) public {
   token = _token;
}


struct PlayersStruct {
   uint betAmount;
   uint betOnNumber;
}

mapping(address => PlayersStruct) public balances;

function enterLottery(string memory _betOnNumber) public payable {

    address player = msg.sender;
    uint amount = msg.value;

    
    token.transferFrom(player, address(this), betAmount);

    balances[player].betAmount += amount ;
    balances[player].betOnNumber = _betOnNumber;

}
}