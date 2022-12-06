pragma solidity 0.8.7;

contract TestingTransfer{

uint approvalCount = 1;
uint approvalMinimum = 2;
uint originalAmount;
address payable originalReceiver;

constructor(address payable _oRec, uint _oA){
    originalReceiver = _oRec;
    originalAmount = _oA;
}

function approveTransferRequest() public payable {
    approvalCount += 1;
    
    if(approvalCount >= approvalMinimum){
        (bool success,  ) = originalReceiver.call{value: msg.value}("");
        require(success, "Failed to transfer the funds, aborting.");
    }
}
}