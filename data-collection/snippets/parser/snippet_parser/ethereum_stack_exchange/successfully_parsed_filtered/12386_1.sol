function JustDebug(address _owner) payable{ 
    
    owner = _owner; 
}


function kill() { 
    
    if (msg.sender == owner) selfdestruct(owner); 
}


function greeter(string _greeting) public {
    greeting = _greeting;
}

function greet() constant returns (string) {
    return greeting;
}
