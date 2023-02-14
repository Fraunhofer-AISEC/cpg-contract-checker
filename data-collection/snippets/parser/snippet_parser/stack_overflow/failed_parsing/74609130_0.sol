
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 

contract DividentToken is ERC20 ("DividentToken", "DVD"), Ownable{

    uint dividentAmount;

    address[] participants; 

    constructor() {
        _mint(msg.sender, 1000000000000 *10 ** 18);
        addParticipant(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        addParticipant(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        addParticipant(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
    }

    function mint(address to, uint amount) external onlyOwner {
        _mint(to, amount);
    }
    
    function viewParticipants() public view returns(address[] memory) {
        return participants; 
    }

    function setDividentAmount(uint _dividentAmount) public onlyOwner {
        dividentAmount = _dividentAmount;
    }

    function addParticipant(address _participant) public onlyOwner {
        participants.push(_participant);  
    }

    function payDividents() public onlyOwner { 
        for(uint i = 0; i < participants.length; i++) {  
            transferFrom(owner(), participants[i], dividentAmount); 
    this case first you got to increase allowance for owner()
        
    instead of transfer
            }
        }
    }
