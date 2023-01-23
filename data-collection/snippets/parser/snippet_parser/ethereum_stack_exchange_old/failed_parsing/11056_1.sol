contract Hub {
  event LogSomething(address contract, bytes32 Id);
  ...
  function logSomething(bytes32 Id);
    LogSomething(msg.sender, Id); 

contract Created{ 
   ...
   function important(bytes32 id) {
      .. 
      Hub.logSomething(Id);
