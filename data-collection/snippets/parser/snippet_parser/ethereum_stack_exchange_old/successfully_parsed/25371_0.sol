pragma solidity ^0.4.4;

import "./SafeMath.sol";

contract TestContract is SafeMath {
    struct Result {
        bytes32 name;
        uint256 balance;
        mapping (address => uint256) betBalances;
    }

    function TestContract(bytes32[] _resultNames) {
        for (uint i = 0; i < _resultNames.length; i++) {
            results.push(Result({
            name: _resultNames[i],
            balance: 0
            }));
        }
    }

    function getBetBalance(uint resultIndex) public validResultIndex(resultIndex) constant returns (uint256) {
        return results[resultIndex].betBalances[msg.sender];
    }

    function bet(uint resultIndex) public hasNotEnded payable {
        Result storage result = results[resultIndex];
        result.balance = safeAdd(result.balance, msg.value);
        result.betBalances[msg.sender] = safeAdd(result.betBalances[msg.sender], msg.value);
    }
}
