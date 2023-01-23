string private privateInfo;
mapping(address => bool) public paidAccounts;

...

function getPrivateInfo() public view returns(string) {
  require(paidAccounts[msg.sender] == true); 
  return(privateInfo);
}
