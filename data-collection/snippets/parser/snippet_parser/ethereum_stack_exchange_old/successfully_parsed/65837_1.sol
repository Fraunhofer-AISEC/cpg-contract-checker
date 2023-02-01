pragma solidity >=0.4.0 <0.6.0; 

contract Workload {

address payable public receiver;

constructor(address payable _receiver) public {
    receiver = _receiver;
}

event Sent();


function getBalance(address _from) public view returns (uint256) {
    return address(_from).balance;
}


function getSender() public view returns (address){
    return address(msg.sender);
}


function send() public payable {
    require(msg.value > 0);
    address payable sender = msg.sender;
    require(msg.value <= sender.balance, "Insufficient balance.");
    receiver.transfer(msg.value);
    emit Sent();
}
}
