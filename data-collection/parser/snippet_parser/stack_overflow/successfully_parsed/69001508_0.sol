 
    
    pragma solidity 0.7.6;
    
    
    contract Storage {
    
    
          uint256 public constant GROUP_MASK = uint256(uint128(~0)) << 128;
    
        
        function store(uint256 id)  public view returns (uint256){
            
             uint256 shiftedGroupId = (id & GROUP_MASK);
            uint256 groupId = shiftedGroupId >> 128;
            
            return groupId;
          
        }
 
    }
