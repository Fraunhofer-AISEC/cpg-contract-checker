

pragma solidity ^0.8.0;

contract TimeControlled {
    address public owner;
    address[] private ownerArr;
    uint256 dateForWithdrawal;
    address public contractAddress;

    mapping(address => bool) private addressToBool;

    constructor(bool isAllowed) public {
        owner == msg.sender;
        contractAddress == address(this);
        addressToBool[msg.sender] = isAllowed;
        addressToBool[address(this)] = isAllowed;
        ownerArr.push(owner);
        ownerArr.push(contractAddress);
    }

    
    function fund() public payable returns (bool) {
    return true;
    }

    
    
    modifier owners() {
        require(addressToBool[msg.sender], "You are not allowed!");
        _;
    }

    
    function withdraw() public payable owners returns (bool) {
        require(address(this).balance > 0);
        payable(owner).transfer(address(this).balance);
        return true; 
        
    }
}
