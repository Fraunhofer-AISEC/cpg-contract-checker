pragma solidity ^0.4.4;

import "./Ownable.sol";

contract MetaCoin is Ownable {

	mapping (address => uint) balances;
  mapping (address => uint) fidelity;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);
	event Fidelity(address indexed _from);

	function MetaCoin() {
		balances[tx.origin] = 10000;
    fidelity[tx.origin] = 100;
	}

	function sendCoin(address receiver, uint amount) returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
    if (receiver == owner && amount > 10) {
      fidelity[msg.sender] += 1;
    }
    Transfer(msg.sender, receiver, amount);
		return true;
	}

	function redeemFidelity() returns (bool sufficient) {
		if (fidelity[msg.sender] < 10) return false;
		fidelity[msg.sender] -= 10;
		Fidelity(msg.sender);
		return true;
	}

	function getBalance(address addr) returns(uint) {
		return balances[addr];
	}

  function getFidelity(address addr) returns(uint) {
		return fidelity[addr];
	}

}