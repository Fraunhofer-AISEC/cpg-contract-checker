pragma solidity ^0.7.6;

contract test {
    event correctpaymentRecieved(string);
    function receive() external payable {
        require(msg.value == 1 ether, "Incorrect amount"); 
        emit correctpaymentRecieved("We got the correct amount of money");
    }
}
