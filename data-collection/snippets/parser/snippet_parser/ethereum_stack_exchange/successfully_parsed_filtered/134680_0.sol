
pragma solidity ^0.8.16;

library LibraryToForciblySendFundsTo {
    function balance() public view returns(uint256) {
        return address(this).balance;
    }
    function send(address payable recipient) public {
        recipient.transfer(address(this).balance);
    }
}

contract SelfDestruct { 

    uint256 public time;

    function updateTime() public {
        time = block.timestamp;
    }

    receive() external payable {}

    function destroy(address payable libraryAddress) public {
        selfdestruct(libraryAddress);
    }

    function balance() public view returns(uint256) {
        return address(this).balance;
    }

 }
