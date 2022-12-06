contract MyData{
   address allowedAddress;
   string A;

   modifier onlyAllowedAddress(){
    require(allowedAddress == msg.sender);
    _;
   }
   event MyDataLogs(string _a) **onlyAllowedAddress**;

  function setA(string arg){
   A = arg;
   MyDataLogs(arg);
 }
}
