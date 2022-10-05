pragma solidity >=0.5.0 <0.9.0;

contract test{
  string[] stocks;

  
  mapping(address=>string[]) public portfolio;
    
    
    function addIfNotPresent(string memory tick) public {
        address user=msg.sender;
        uint arrayLength = stocks.length;
        if(arrayLength == 0){
            portfolio[user].push(tick);
            
            
            
            stocks.push(tick);
        }else{
            bool found=false;
            for (uint i=0; i<arrayLength; i++) {
                if (keccak256(abi.encodePacked(portfolio[user][i])) == keccak256(abi.encodePacked(tick))) {
                found = true;
                break;
                }
            }
            if(!found){
                portfolio[user].push(tick);
                stocks.push(tick);
            
            }
        }
    }
}```
