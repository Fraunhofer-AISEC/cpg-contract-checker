pragma solidity ^0.5.0;
contract ApprovalContract{
    address payable owner = msg.sender;
    mapping(address => uint256) balance;
    function deposit() external payable {
            require(msg.value > 0);
            sender = msg.sender;
            deposited = msg.value;
            receiver = owner;
            balance[sender] = deposited;
            receiver.transfer(deposited);
    }
}
