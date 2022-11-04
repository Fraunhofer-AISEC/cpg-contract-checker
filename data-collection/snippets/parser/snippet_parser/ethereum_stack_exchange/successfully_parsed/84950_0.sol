pragma solidity ^0.4.24;

import "./Ownable.sol";
import "./Agent.sol";

contract EnergyExchange is Ownable{
    
     struct Info {
        Agent ainstance;
    }
    mapping (address => Info) public contractInstance;
    
    
   function addAgentContractInstance(Agent _contractInstance) public{
        contractInstance[msg.sender].ainstance = _contractInstance;
       
    }
    
    function getAgentContractInstance() public view returns (Agent){
        
        return contractInstance[msg.sender].ainstance;
    }

    
    
    
}
