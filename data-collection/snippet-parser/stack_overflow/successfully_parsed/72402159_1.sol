
pragma solidity ^0.8.0;

contract Bank {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You're not the smart contract owner!");
        _;
    }

    event Deposited(address from, uint amount);

    function depositMoney() public payable {
        emit Deposited(msg.sender, msg.value);
    }

    
    function withdrawMoney(address _to, uint _value) public onlyOwner {
        payable(_to).transfer(_value);
    }

    
    function getSmartContractBalance() external view returns(uint) {
        return address(this).balance;
    }

}
