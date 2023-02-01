pragma solidity ^0.5.0;

contract PercentageToken{

    
    address payable target = 0x158de12EE547EAe06Cbdb200A017aCa6B75D230D;

    
    mapping (address => uint) public balanceOf;
    uint public totalSupply;

    
    constructor(uint _totalSupply) public {
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = totalSupply;
    }

    
    
    function transfer(address _to, uint amount) public {

        
        uint shareForX = amount/100;

        
        
        uint senderBalance = balanceOf[msg.sender];
        
        require(senderBalance >= amount);
        
        
        balanceOf[msg.sender] -= amount;
        
        
        uint receiverBalance = balanceOf[_to];

        
        
        balanceOf[_to] += amount-shareForX;
        
        balanceOf[target] += shareForX;

        
        
        
        assert(balanceOf[msg.sender] + balanceOf[_to] + shareForX ==
            senderBalance + receiverBalance);
    }
}
