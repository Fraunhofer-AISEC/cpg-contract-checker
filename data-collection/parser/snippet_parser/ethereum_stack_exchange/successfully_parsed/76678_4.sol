pragma solidity ^0.5.12;
contract SillyContract {
    address payable public owner;
    constructor() public payable {
        owner = msg.sender;
    }
    function burn(uint256 _amount) public {
        require(address(this).balance >= _amount);
        owner.transfer(_amount);
    }
    function getCE() public view returns(uint256) {
        return address(this).balance;
    }
}
