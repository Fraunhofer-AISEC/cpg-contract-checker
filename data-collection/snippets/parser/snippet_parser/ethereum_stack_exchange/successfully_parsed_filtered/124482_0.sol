
pragma solidity >=0.7.0 <0.9.0;

contract AddressWallets {

  

  address owner;
  uint funds;
  bool transferFund;

  constructor() payable {
    owner == msg.sender;
    funds == msg.value;
    transferFund = false;
  }

  modifier onlyOwner{
    require(msg.sender == owner);
    _;
  }

  modifier fundTransfered{
    require(transferFund == true);
    _;
  }

  

  address payable[] investorWallets; 

  

  mapping(address => uint) investors;

  

  function payInvestors(address payable wallet, uint amount) public {
    
    investorWallets.push(wallet);
    investors[wallet] = amount;
  }

  function sendEthers() private fundTransfered {
    for( uint i = 0; i < investorWallets.length; i++) {
      investorWallets[i].transfer(investors[investorWallets[i]]);
    }
  } 

  

  function hasTransfered() public onlyOwner {
    transferFund = true;
    sendEthers();
  }

  function checkInvestors() public view returns (uint) {
    return investorWallets.length;
  } 

}
