    contract Sender {   
    function send(address _receiver , uint amount) public payable {
        address payable pReceiver = address(uint160(_receiver)); 
         pReceiver.send(amount); 
    } 
    function sending(address _receiver , uint amount) public payable {   
        address payable pReceiver = address(uint160(_receiver));     
        pReceiver.send(amount);
     }
 }

  contract Receiver {
  uint public a = 2;
  function aIs() public returns (uint256){
          return a;
      }

  function () payable external {
    if (msg.value == 0){
              require(true,"value is 0");
              a = 0;
          }   
          else{
             require(true,"value is not 0");
              a = 1;
          }
          aIs();
  }
}
