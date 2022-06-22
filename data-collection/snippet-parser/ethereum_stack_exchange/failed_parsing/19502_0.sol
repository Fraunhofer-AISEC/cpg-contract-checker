MyContract {


  event myEvent(bytes32 id);
  function myTran(bytes32 arg) {
     myEvent(arg);
  }
}
