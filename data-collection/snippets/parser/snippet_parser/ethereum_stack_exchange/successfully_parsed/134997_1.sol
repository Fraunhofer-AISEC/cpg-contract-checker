
pragma solidity 0.8.13;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Store is Ownable {

    function depositEth() public payable {}

    function withdrawEth() public onlyOwner {
        uint amount = address(this).balance;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Failed to send Ether");
    }
    
}
