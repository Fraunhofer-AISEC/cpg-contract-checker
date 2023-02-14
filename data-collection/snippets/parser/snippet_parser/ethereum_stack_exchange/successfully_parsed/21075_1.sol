modifier CheckValue() { 
    if (msg.value != 5 ether) throw; 
    _; 
}

function foo() CheckValue returns(returntype) {
    
}
