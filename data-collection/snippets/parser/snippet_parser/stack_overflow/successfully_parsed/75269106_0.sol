
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract is Ownable {
    function getCurrentBalance() public view onlyOwner returns (uint) {
        return address(this).balance;
    }
    receive() external payable {}
}

contract ManageOwner is MyContract {
    function changeOwner(address newOwner) public  {
        super.transferOwnership(newOwner);
    }
}
