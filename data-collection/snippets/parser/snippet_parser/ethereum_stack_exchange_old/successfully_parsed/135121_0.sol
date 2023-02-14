struct StructAccount { 
  uint256 Index; 
  address Wallet; 
  uint256 Balance; 
  uint256 Time; 
  uint256 RegDate;
  uint256 LastDate;
  }  

StructAccount[] public Accounts;


function getLowerLastDate() public view returns (uint, address) {
  uint    lowerDate = block.timestamp;
  uint    Key = 0;
  for (uint i = 0; i < Accounts.length; i++) {
    if(Accounts[i].LastDate != 0){
        if( Accounts[i].LastDate <= lowerDate ){
            lowerDate = Accounts[i].LastDate;
            Key = i;
        }
    }
  }
  Accounts[Key].LastDate = 0; 
  return (lowerDate, Accounts[Key].Wallet) ;
}
