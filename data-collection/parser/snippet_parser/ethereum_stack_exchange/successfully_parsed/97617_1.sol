pragma solidity 0.7.6;

contract Collect {
    
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    function deposit() external payable {
        require(msg.value == 2 ether, "please send two ether");
    }
    
    function withdraw() external {
        require(msg.sender == owner, "No");
        msg.sender.transfer(address(this).balance);
    }
    
    
    
    function balance() external view returns(uint balanceEth) {
        balanceEth = address(this).balance;
    }
}
