 function UserRegister(string memory userName,uint feiyong ) public payable returns(string memory isOK,string memory resourceID){
   
   emit LogContractAddress(msg.sender,address(this));
   emit LogData(msg.data);
   
   if (bytes(users[userName].name).length==0){

       emit UserRegisterEVENT("null",userName);
       return ("null",userName);
   }
   else
   {
       emit UserRegisterEVENT("UserName has been registered","null");
       return("UserName has been registered","null");
   }
}
