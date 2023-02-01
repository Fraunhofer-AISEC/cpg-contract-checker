struct userAccount{
     address userAddress;
     string Userpassword;
     string Username;
}


  constructor() {
   userAccount.userAddress = msg.sender;
}

modifier onlyUser {
    require(userAccount.userAddress == msg.sender, "Only user can set Pasword and Username");
    _;
}

function addAccount(string memory Userpassword, string memory Username) public onlyUser{
 accounts[msg.sender] = userAccount(msg.sender, Userpassword, Username);
 accountCount++;
}
