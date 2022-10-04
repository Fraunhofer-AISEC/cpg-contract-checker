pragma solidity ^0.4.17;

contract depositTest {

    uint256 public fee = 2000000000000000000 wei;

    function depositUsingParameter(uint256 deposit) public payable {  
        require(msg.value == deposit);
        deposit = msg.value;
    }

    function depositUsingVariable() public payable { 
        require(msg.value == fee);
        fee = msg.value;
    }

    function getContractBalance() public view returns (uint256) { 
        return address(this).balance;
    }

    function withdraw() public { 
        msg.sender.transfer(address(this).balance);
    }

    function() public payable {
    
    }
}
