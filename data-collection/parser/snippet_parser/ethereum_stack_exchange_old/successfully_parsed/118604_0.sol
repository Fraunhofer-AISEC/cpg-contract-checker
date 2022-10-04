function whitelistBatch(address[] memory rec, string[] memory name) public onlyOwner { 
  
    for(uint i =0; i< rec.length; i++){  
      count += 1;
      approved[rec[i]] = true;
      buyerName[rec[i]] = name[i];
      buyer[rec[i]] = count;
      
    }
   
 }
