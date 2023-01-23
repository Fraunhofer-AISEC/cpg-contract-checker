pragma solidity >=0.4.0 <0.6.0; 

contract Workload {

    address payable public receiver;

    constructor(address payable _receiver) public payable {
        receiver = _receiver;
    }

    event Sent();

    
    function getBalance(address _from) public view returns (uint256) {
        return address(_from).balance;
    }

    
    function getSender() public view returns (address) {
        return address(msg.sender);
    }

    
    function send(uint amount) public payable {
        address payable sender = msg.sender;
        require(amount <= sender.balance, "Insufficient balance.");
        sender.transfer(amount);;
        emit Sent();
    }
}
