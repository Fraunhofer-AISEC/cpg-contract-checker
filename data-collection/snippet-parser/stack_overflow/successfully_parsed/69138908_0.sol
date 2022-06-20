contract test{
   address owner;
   mapping(address=>bool) authorizedAddresses;
   mapping(address=>bool) isRegistered;
   mapping(uint256=>address) users;
   uint256 userCounter;

   constructor(){
      owner = msg.sender;
   }

   modifier isOwner(){
      require(msg.sender == owner, "Access denied!");
      _;
   }

   function changeOwner(address _to) public isOwner{
      owner = _to;
   }
   
   function authorizeAddress(address _address) public isOwner{
      if(isRegistered[_address]){
         authorizedAddresses[_address] = true;
      }else{
         users[userCounter] = _address;
         isRegistered[_address] = true;
         authorizedAddresses[_address] = true;
         userCounter ++;
      }
   }
   
   function unauthorizeAddress(address _address) public isOwner{
      require(authorizedAddresses[_address], "User is not authorized already");
      authorizedAddresses[_address] = false;
   }

   modifier isAuthorizedAddress(){
      require(authorizedAddresses[_address], "You are not authorized to call this function");
      _;
   }
}