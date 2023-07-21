pragma solidity 0.8.18;

contract Example {
    function payMeOneHbar () public payable {
        require(msg.value == 100_000_000, "Payment required is exactly 1 HBAR");
        
    }
}
