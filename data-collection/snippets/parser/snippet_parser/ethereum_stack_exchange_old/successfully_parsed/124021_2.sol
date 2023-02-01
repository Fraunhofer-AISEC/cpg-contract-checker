contract Sender {
   function send(address payable target) external payable {
        (bool success,)= target.call{value: msg.value}("");
        require(success);
    }
}
