
pragma solidity ^0.8.4;

contract banking{
  mapping(address=>uint) public user_account;
  mapping(address=>bool) public user_existance;

  function createAcc() public payable returns(string memory){
      require(user_existance[msg.sender]==false,'Account already in the database');
      if(msg.value==0){
          user_existance[msg.sender]=true;
          user_account[msg.sender]=0;
          return 'Your account is now in the database';
      }
      require(user_existance[msg.sender]==false,'Account already in the database');
      user_existance[msg.sender] = true;
      user_account[msg.sender] = msg.value;
      return 'account created';
  }
  
  function deposit() public payable returns(string memory){
      require(msg.value>0, 'Dont enter value 0 while depositing');
      require(user_existance[msg.sender]==true, 'Account is not in the database');
      user_account[msg.sender]=user_account[msg.sender]+msg.value;
      return 'Deposit Succesfully';
  }
  
  function withdraw(address payable userAddress, uint amount) public payable returns(string memory){
      require(user_existance[msg.sender]==true, 'Account is not in the database');
      require(amount>0, 'Dont enter value 0 while withdrawing');
      require(user_account[msg.sender]>amount, 'Insufficient Balance');
      user_account[msg.sender]=user_account[msg.sender]-amount;
      msg.sender.transfer(amount);
      return 'withdrawal Succesful';
  }
 
  function TransferAmount(address payable userAddress, uint amount) public returns(string memory){
      require(amount>0, 'Dont enter value 0 while sending');
      require(user_existance[msg.sender]==true, 'Account is not in the database');
      require(user_account[msg.sender]>amount, 'Insufficient Balance');
      require(user_existance[userAddress]==true, 'The Account you want to transfer to does not exist in the database ');
      user_account[msg.sender]=user_account[msg.sender]-amount;
      user_account[userAddress]=user_account[userAddress]+amount;
      return 'transfer succesfully';
  }
  
  function user_accountBalance() public view returns(uint){
      return user_account[msg.sender];
  }
  
  function accountExist() public view returns(bool){
      return user_existance[msg.sender];
  }
  
}
