contract MyContract {
  address payable public owner;
  address payable public withdrawAddress = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; 
  
  constructor() public {
    owner = msg.sender;
    ...
  }

  function totalBalance() external view returns(uint) {
    
    return owner.balance;
  }

  function withdrawFunds() external withdrawAddressOnly() {
    msg.sender.transfer(this.totalBalance());
  }

  modifier withdrawAddressOnly() {
    require(msg.sender == withdrawAddress, 'only withdrawer can call this');
    _;
  }
  
  ...
