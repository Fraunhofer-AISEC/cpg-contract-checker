pragma solidity ^0.5.0; 

contract Register{
    
    address public govermentEntity; 
  
     
    struct Seller {
        address sellerAddress; 
        string sellerLocation;
        string sellerName;
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
  
     function getSellerDetails(address addr) external view returns (address, string memory,string memory){
        
        return(registeredSellers[addr].sellerAddress, registeredSellers[addr].sellerLocation,registeredSellers[addr].sellerName);
    }
    





pragma solidity ^0.5.0; 

 interface RegisterSC{
       function getSellerSortingmMachineDetails(address addr) external view returns ( address [] memory); 
    }
    
contract Tracking{
    
    string public status;
    address public caller; 

modifier sortingMachineOnly (address registerContractAddr, address sellerAddr){
        
        address[] memory tempArray; 

       RegisterSC registerSC = RegisterSC(registerContractAddr); 
       tempArray = registerSC.getSellerSortingmMachineDetails(sellerAddr); 
      
       for(uint256 i=0; i< tempArray.length; i++){ 
       
         if (msg.sender == tempArray[i])
          _;
          
       }
        
   }

function updateStatusSorted (address registerContractAddr, address sellerAddr, address plasticBottleAddress) public sortingMachineOnly (registerContractAddr, sellerAddr){
        
       plasticBaleContributorsAddresses.push(bottleToRecycler[plasticBottleAddress]); 
       plasticBale.push(plasticBottleAddress);
       bottlesSortedCounter++;
       status = 'sorted';
        }

