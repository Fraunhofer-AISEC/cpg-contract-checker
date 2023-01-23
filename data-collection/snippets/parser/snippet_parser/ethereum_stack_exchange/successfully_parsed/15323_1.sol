contract test { 

mapping (address => uint256) public balanceOf; 

function test() { 

}

function FunctionX(address _address)
{
    balanceOf[_address] = 50000;    
}
}
