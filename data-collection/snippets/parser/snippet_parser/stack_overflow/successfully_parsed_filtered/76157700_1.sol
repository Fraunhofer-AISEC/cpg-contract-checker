pragma solidity ^0.8.0;

contract Transfer {
    function transfer(address payable account1, address payable account2, uint amount) public {
        require(address(this).balance >= amount * 2, "Insufficient funds in contract");
        account1.transfer(amount);
        account2.transfer(amount);
    }
}
