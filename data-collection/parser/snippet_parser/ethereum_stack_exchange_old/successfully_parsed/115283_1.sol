function setTokenAmount(uint256 _tokenamount) external onlyOwner {
     tokenAmount = _tokenamount;
     uint256 num = registered.length;
     transferFrom(admin, address(this), _tokenAmount * num);
     for (uint i=0; i<num; i++) {
        approve(registered[i], _tokenAmount);  
     }
 }
