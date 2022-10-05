pragma solidity ^0.5.0; 

contract Registeration{
    
    address public govermentEntity;

    struct Buyer{
    address buyerAddress; 
    string buyerName; 
    string buyerLocation; 
    string buyerBusinessType; 
    bool isExist;
    }
  

    modifier onlyGovermentEntity{
        require(msg.sender == govermentEntity,
        "Entity not authorized to register stakeholders.");
        _;
    }
   
  
    mapping (address => Buyer) registeredBuyers; 
       
    function registerBuyer (address addr, string memory buyerName, string memory buyerLocation, string memory buyerBusinessType) public onlyGovermentEntity {
        require(registeredBuyers[addr].isExist == false , "Buyer is registered already."); 
        registeredBuyers[addr] = Buyer(addr, buyerName, buyerLocation, buyerBusinessType, true);
    }
   
    function isBuyerExist(address addr) external view returns (bool){
        return(registeredBuyers[addr].isExist);
    }
}

