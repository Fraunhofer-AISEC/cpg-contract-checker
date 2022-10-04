pragma solidity >=0.4.22 <0.9.0;

contract TransferService {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
}
