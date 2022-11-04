pragma solidity ^0.8.0;

contract SimpleBank {
    string public name;
    address public owner;
    mapping (address => uint256) public funds;
    address[] public funders;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    function getBalance() public view returns (uint256){
        return owner.balance;
    }
    function getAddress() public view returns(address){
        return owner;
    }
    function RecieveMoney() public payable{
        funds[msg.sender] += msg.value;
        funders.push(msg.sender);
    }
}
