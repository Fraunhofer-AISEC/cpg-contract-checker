pragma solidity ^0.4.18;
contract EtherGame {
    mapping(address => uint256) public balances;

    function depositFunds() public {
        balances[msg.sender] += msg.value;
        }

    function call_amount() public returns(uint256) {
        return this.balance;
    }
}
