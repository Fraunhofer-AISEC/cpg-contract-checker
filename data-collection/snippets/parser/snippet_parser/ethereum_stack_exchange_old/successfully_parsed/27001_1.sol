pragma solidity ^0.4.1;

contract MyToken {
    mapping (address => uint) public balanceOf;
    event SenderLogger(address);
    event ValueLogger(uint);

   
   

   constructor (uint256 initialSupply) public payable {
       
       balanceOf[msg.sender] = initialSupply;   
   }

   
   function transfer(address _to, uint256 _value) public payable {

    
    require(balanceOf[msg.sender] >= _value);

    
    require(balanceOf[_to] + _value >= balanceOf[_to]); 

    
    balanceOf[msg.sender] -= _value;     

    
    balanceOf[_to] += _value;                           
}

function () private payable {
    emit SenderLogger(msg.sender);
}
}