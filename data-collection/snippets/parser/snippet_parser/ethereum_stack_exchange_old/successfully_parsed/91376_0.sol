pragma solidity ^0.5.0; 

contract Register{
    
    
    
    
    address public govermentEntity; 
    
  
    
    struct Seller {
        address sellerAddress; 
        string sellerLocation;
        address [] sortingMachineAddress; 
        bool isExist;
    }
    

    
    
    constructor() public{
     govermentEntity = msg.sender; 
    }
    
    
  
    mapping (address => Seller) registeredSellers; 
    
    modifier onlyGovermentEntity{
        require(msg.sender == govermentEntity, "Entity not authorized to register stakeholders.");
        _;
    }
    
    
    function registerSeller (address addr, string memory sellerLocation, address sortingMachineAddress) public onlyGovermentEntity {
        require(registeredSellers[addr].isExist == false , "Seller is registered already."); 
        
        registeredSellers[addr] = Seller(addr, sellerLocation, sortingMachineAddress, true);  
    }
    
   
    
}
