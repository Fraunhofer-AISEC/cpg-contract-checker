function FetchDetail(address userAddress) public constant returns(string,uint )
  {
    string memory  data1;
    uint  data2;
    UserRegistration ud=new UserRegistration();
   (data1,data2)= ud.getUserData(userAddress);
    return(data1,data2);
  }
