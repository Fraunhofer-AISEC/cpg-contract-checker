contract SendEther {
    function sendViaCall(address payable _to) public payable {
    
    (bool success, bytes memory data) = _to.call{value: msg.value}("");
    require(success, "Failed to send Ether");
   }
  }
