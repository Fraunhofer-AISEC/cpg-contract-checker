pragma solidity >=0.4.22 <0.9.0;

...
uint256 _totalSupply;
mapping(address => uint256) _playersDeposit;

function deposit() public payable {
    require(msg.sender.balance >= msg.value, "Balance is greater than value");
    require(msg.sender != _ownerAddress, "Requester is owner");

    _totalSupply += msg.value;
    _playersDeposit[msg.sender] += msg.value;
}
