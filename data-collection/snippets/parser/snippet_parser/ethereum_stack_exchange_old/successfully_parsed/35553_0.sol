contract minimum {

  uint256[] a = [1,2,3,4];

  function createOffersAsList() public returns (uint256[]) {

    uint256[] storage b;
    uint256 i = 0;

    Logger("Before loop", b); 
    
    
    
    while (i<4) {
        b.push(a[i]);
        i++;
    }
    Logger("After loop", b);
    return b;
    
    
  }

  event Logger(string s, uint256[] u);
}
