

pragma solidity ^0.7.1;

contract WETH9 {   
    
    event Deposit(address indexed dst, uint wad);

    mapping (address => uint) public balanceOf; 

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function totalSupply() public view returns (uint) {
        return address(this).balance;
    }
}
