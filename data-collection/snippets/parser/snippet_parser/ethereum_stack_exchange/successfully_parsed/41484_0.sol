pragma solidity ^0.4.18;

import "./ConvertLib.sol";

contract MetaCoin {
    mapping (address => uint) balances;

    event NewDeposit(address _from, uint256 _value);

    function MetaCoin() public {
        balances[tx.origin] = 10000;
    }

    function getBalance(address addr) public view returns(uint) {
        return balances[addr];
    }

    function deposit() payable {
        balances[msg.sender] += msg.value;
        NewDeposit(msg.sender, msg.value);
    }

    function withdraw() {

        if ( ! (msg.sender.call.value(balances[msg.sender])() ) ) {
            throw;
        }

        balances[msg.sender] = 0; 
    }                   
}
