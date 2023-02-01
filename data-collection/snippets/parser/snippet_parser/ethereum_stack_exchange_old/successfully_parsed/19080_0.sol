pragma solidity ^0.4.0;

contract exchange {
    mapping (address => uint256) public balances;
    event PaymentDone(string s);

    function Channel( uint value) payable {
        balances[msg.sender] -=value;
        balances[this] +=value;
    }

    function CloseChannel( address to,uint value) {
        if (to.send(value)) {
            PaymentDone("Done");
        }
    }
}
