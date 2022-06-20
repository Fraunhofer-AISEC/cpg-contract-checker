pragma solidity ^0.7.6;

contract MyFirstPolygonContract {


    string private name;
    uint private amount;
    
    function sendFunds(address receiver) external payable {
        payable(receiver).call{value: msg.value}('');
    }


    function setName(string memory newName) public {
        name = newName;
    }


    function getName () public view returns (string memory) {
        return name;
    }
    

    function setAmount(uint newAmount) public {
        amount = newAmount;      
    }


    function getAmount() public view returns (uint) {
        return amount;
    }
}
