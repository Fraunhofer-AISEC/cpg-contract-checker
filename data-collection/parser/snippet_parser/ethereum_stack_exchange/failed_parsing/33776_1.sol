uint public requiredSenders = 10; 
uint public currentSenders = 0;
uint public accumulatedFunds = 0;

address public beneficiary = 0x0...; 

function combineAndTransfer() public payable {
 currentSenders++;
 require(currentSenders <= requiredSenders);

 
 accumulatedFunds += msg.sender;

 
 if(currentSenders == requiredSenders){
  uint fundsToTransfer = accumulatedFunds;
  accumulatedFunds = 0;
  beneficiary.transfer(fundsToTransfer);
 }

}
