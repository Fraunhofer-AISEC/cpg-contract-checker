contract TestSend {

  function sendToOther(address receiver) payable returns(bool success) {
    if(!receiver.send(msg.value) throw; 

...
