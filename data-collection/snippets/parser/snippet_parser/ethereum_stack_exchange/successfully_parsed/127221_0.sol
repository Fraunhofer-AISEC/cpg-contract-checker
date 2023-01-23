
pragma solidity ^0.8.10;

contract ReceiveEther {

    receive() external payable {}
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw() public payable{
        payable(address(msg.sender)).transfer(address(this).balance);
    }
}

contract SendEther {
    function sendViaCall(address payable _to) public payable {
        
        
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

interface With{
    function getBalance() external view returns(uint);
    function withdraw() external payable;
}

contract WithrawAmtFromAnotherContract{
    function getBalance(address _address) public view returns(uint){
        return With(_address).getBalance();
    }
    function stealAmntFromContract_method1(address payable _address) public payable{
        With(_address).withdraw();
    }
    function stealAmntFromContract_method2(address payable _address) public payable{
        payable(msg.sender).transfer(_address.balance);
    }
}
