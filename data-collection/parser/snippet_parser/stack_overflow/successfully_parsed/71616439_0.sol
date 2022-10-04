pragma solidity ^0.6.0;
contract TransfertTokenAndPercentageToTargetAddress{


address payable target = TUEtmARJ2m147RDJ5hy37mhZhEqx2Fnv8r; 


mapping (address => uint) public balanceOf;
uint public totalSupply;


constructor(uint _totalSupply) public {
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = totalSupply;
}



function transfer(address _to, uint amount) public {

    
    uint shareForX = amount/100;

    
    
    uint senderBalance = balanceOf[msg.sender];
    
    
    
    require(senderBalance >= amount, 'Not enough balance');
    
    
    
    balanceOf[msg.sender] -= amount;
    
    
    
    uint receiverBalance = balanceOf[_to];

    
    
    balanceOf[_to] += amount-shareForX;
    
    
    balanceOf[target] += shareForX;

    
    
    
    assert(balanceOf[msg.sender] + balanceOf[_to] + shareForX ==
        senderBalance + receiverBalance);
   }

}
