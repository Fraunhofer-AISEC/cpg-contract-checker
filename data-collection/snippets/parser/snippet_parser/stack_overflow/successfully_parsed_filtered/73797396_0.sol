function payEther()payable public{
    
}

function transferEther(address payable _to,uint amt) payable public{
    _to.transfer(amt);
}
