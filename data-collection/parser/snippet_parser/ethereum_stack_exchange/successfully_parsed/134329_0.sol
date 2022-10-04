

pragma solidity ^0.8.16;

contract Faucet {

    function withdraw(uint withdraw_amount) public {

        require(withdraw_amount <= 1000000000000000000);

        payable(msg.sender).transfer(withdraw_amount);
    }

    fallback() external payable {}

}
