    pragma solidity ^0.4.18;
contract EtherGame {
    mapping(address => uint256) public balances;
    uint256 public contract_balances;

    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
        contract_balances = this.balance;
    }
}
