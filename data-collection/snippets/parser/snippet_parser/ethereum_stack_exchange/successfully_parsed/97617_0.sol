pragma solidity >=0.7.0 <0.9.0;


contract  AcceptEth {

    address public owner;
    uint public price = 2 ether;
    mapping (address => uint) balance;
    
    uint256 public val = 1;

    constructor() {
        owner = msg.sender;
    }


    function accept() payable public {
        
        require(msg.value == price);

        
        balance[address(this)] += msg.value;
    
    
    }

    function check() public returns(uint256) {
        
        require(msg.sender == owner);
    
        
        return address(this).balance;
    
    }

    function collect() payable public {
        
        require(msg.sender == owner);
    
        
        balance[owner] += balance[address(this)];
    
    
    }


}
