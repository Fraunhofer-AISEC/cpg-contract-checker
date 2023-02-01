
pragma solidity ^0.8.0;

contract Receiver {
    receive() external payable {}

    fallback() external payable {}

    function receiveBalance() public payable {}

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    
}

contract SendEther {

    address public owner = msg.sender;

    
    modifier onlyOnwer() {
        require(msg.sender == owner);
        _;
    }

    function deposit(uint256 amount) public payable {
        require(msg.value == amount); 
    }

    function deposit_v2() public payable {
        
    }

    
    receive() external payable {}

    fallback() external payable {}

    
    function sendViaTransfer(address payable to, uint256 amount) public payable onlyOnwer {

        
        require(address(this).balance >= amount, "Not enough balance in the contract.");

        to.transfer(amount);
    }

    
    function sendViaTransfer_v2(address payable to) public payable onlyOnwer {
        to.transfer(msg.value);
    }

    
    function sendViaSend(address payable to, uint256 amount) public payable onlyOnwer {

        
        require(address(this).balance >= amount, "Not enough balance in the contract.");

        bool success = to.send(amount);
        require(success, "Error sending eth");

    }

    
    function sendViaSend_v2(address payable to) public payable onlyOnwer {
        bool success = to.send(msg.value);
        require(success, "Error sending eth");
    }

    
    function sendViaCall(address payable to, uint256 amount) public payable onlyOnwer {

        
        require(address(this).balance >= amount, "Not enough balance in the contract.");

        (bool success, ) = to.call{value: amount}("");
        require(success, "Error sending eth");

    }

    
    function sendViaCall_v2(address payable to) public payable onlyOnwer {
        (bool success, ) = to.call{value: msg.value}("");
        require(success, "Error sending eth");
    }

    
    function sendViaCustomFunction(address payable to, uint256 amount) public payable onlyOnwer {

        
        require(address(this).balance >= amount, "Not enough balance in the contract.");

        Receiver(to).receiveBalance{value: amount}();

    }

    
    function sendViaCustomFunction_v2(address payable to) public payable onlyOnwer {
        Receiver(to).receiveBalance{value: msg.value}();
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

}
