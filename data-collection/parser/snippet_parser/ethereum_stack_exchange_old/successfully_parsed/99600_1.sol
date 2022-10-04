pragma solidity >=0.8.0;

contract Reentrancy {
    function withdraw(uint amount) public payable {
        require (address(this).balance > amount);
        payable(msg.sender).transfer(amount);
    }

}
