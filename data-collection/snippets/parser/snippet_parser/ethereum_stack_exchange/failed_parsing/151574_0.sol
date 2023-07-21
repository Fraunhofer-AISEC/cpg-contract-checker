pragma solidity ^0.8.18;
    
    
       
    contract FundMe {
    
        uint256 public minimumUsd = 5;
    
        function Fund() public payable {
              
             
             
             require(msg.value > minimumUsd, "didn't sent enough ETH") ; 
              
            
              
              function getPrice public { 
    
    
                 }
    
              
              function getConversionRate() public {} 
    
    
              function getVersion() public view returns(uint256){
                 return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
              }                                                                     
    
        }
            
    
    }
