
pragma solidity ^0.7.0;

import "./Pool.sol";
import "./Cube.sol";

contract System is Cube, Pool{

    
    address public referer;
    bool internal registered = false;
    mapping(address => bool) public isRegistered;
    mapping(address => uint256) internal balanceOf;

    constructor() public {
        address adminWallet = msg.sender;
    }

    
    function viewRegister() public view returns(bool _isRegistered) {
        _isRegistered = isRegistered[msg.sender];
        return _isRegistered;
    } 
    
    
    function initalRegisterPayment(uint256 defaultAmount) payable public returns(bool success) {
        require(isRegistered[msg.sender] = false, "You are already registered!");
        require(balanceOf[msg.sender] >= 0.13 ether, "You are already registered!");

        defaultAmount = 0.13 ether;

        balanceOf[msg.sender] -= defaultAmount;
        
        balanceOf[System] -= 0.03 ether;
        balanceOf[adminWallet] += 0.03 ether;
        
        balanceOf[System] -= 0.05 ether;
        balanceOf[Pool] += 0.05 ether;
        
        balanceOf[System] -= 0.05 ether;
        balanceOf[Cube] += 0.05 ether;
        
        return true;
    }
    
    function register(address _newAddress) public {
        require(isRegistered = false, "You are already registered!");
    }
}
