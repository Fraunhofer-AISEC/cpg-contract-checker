contract Sender {
  function send(address _receiver) payable {
    _receiver.call.value(msg.value).gas(20317)();
  }
}

contract Receiver {
   uint public balance = 0;

   function () payable {
      balance += msg.value;
   }
 }
