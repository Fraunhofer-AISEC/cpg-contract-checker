 mapping(uint256 => address) public userOf; 

address admin;


event SetTokenInfoEvent(uint16 tokenCode, string symbol, address tokenAddr, uint256 totaltokens);


constructor() public{
admin = 0xc8e3b905E7d462BD6368240BEC9C482b215D4147;
}




function deposit() public payable {
    require(msg.value > 0);
}

 function withdraw(uint256 amount,uint256 _cusid) public {
    require(userOf[_cusid]==msg.sender);
    require(amount > 0);
    msg.sender.transfer(amount);
}

function storecustomer(address user,uint256 _cusid) public returns(bool)
{
   require(admin == msg.sender);
  userOf[_cusid]=user;
   return true;
}



function tokenDeposit(address tokenaddr,uint256 tokenAmount) public payable
{
     Token(tokenaddr).transferFrom(msg.sender,address(this), tokenAmount);
}



function tokenWithdraw(uint256 _cusid,uint16 tokenAddr,address withdrawAddr, uint256 tokenAmount) public payable
{
     require(userOf[_cusid]==msg.sender);
     Token(tokenAddr).transfer(withdrawAddr, tokenAmount);

}
