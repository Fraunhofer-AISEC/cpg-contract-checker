

pragma solidity >=0.7.0 < 0.9.0;







interface CUSDToken {
  function approve(address, uint256) external returns (bool);
  function balanceOf(address) external view returns (uint256);
  function transferFrom(address, address, uint256) external returns (bool);
}

contract celoBNB {
    
    
    
    
    
    address payable lessorAddress;
    address payable leaseeAddress;

    
    
    
    struct space {
        uint256 pricecUSD;
        address currentOccupant;
        bool spaceIsAvailable;
        }
    
    
    
    
    space[8] spaceDB;
    
      
    address internal cUsdTokenAddress;
    
    
    modifier ownerOnly() {
        require(msg.sender == lessorAddress);
        _;
        }
    
        
    constructor() public {
        
        
        lessorAddress = msg.sender;
        
        
        
        
        for (uint i=0; i<8; i++) {
            spaceDB[i].spaceIsAvailable = true;
            }
    }


    
    
    
    
    
    function getSpaceAvailability(uint _space) public view  returns(bool) {
        return spaceDB[_space].spaceIsAvailable;
    }

    
    function getPriceOfSpace(uint _space) public view  returns(uint256) {
        return spaceDB[_space].pricecUSD;
    }

    
    function getCurrentOccupant(uint _space) public view  returns(address) {
        return spaceDB[_space].currentOccupant;
    }

    
    
    

    
    
    function setSpaceAvailability(uint8 _space, bool _newAvailability) lessorOnly public {
        spaceDB[_space].spaceIsAvailable = _newAvailability;
        
        
        
        if (_newAvailability) {
            spaceDB[_space].currentOccupant = address(0);
        }
    }
    
    
    
    function setPriceOfSpace(uint8 _space, uint256 _priceInWei) lessorOnly public {
        spaceDB[_space].pricecUSD = _pricecUSD; 
    }
    
    
    function rentASpace(uint8 _space) public payable returns(uint256) {

        
        leaseeAddress = msg.sender;

        
        
        
        if (msg.value % spaceDB[_space].pricecUSD == 0 && msg.value > 0 && spaceDB[_space].spaceIsAvailable == true) {

            
            uint256 numberOfNightsPaid = msg.value / spaceDB[_space].pricecUSD;

            
            spaceDB[_space].spaceIsAvailable = false;

            
            spaceDB[_space].currentOccupant = leaseeAddress;

            
            lessorAddress.transfer(msg.value);

            
            
            return numberOfNightsPaid;
        
        
        
        } else {
            
            
            leaseeAddress.transfer(msg.value);
            
            
            return 0;
        }
        
    }   
}`
