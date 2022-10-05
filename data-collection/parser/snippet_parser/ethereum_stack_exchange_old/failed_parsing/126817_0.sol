event Transfer(address indexed from, address indexed to, uint256 value);


function transfer1(address to, uint tokens) public returns (bool success) {
    emit Transfer(msg.sender, to, tokens);
    return true;
}

function transfer2() public returns (bool success){
    uint256 amount = 1;
    emit Transfer(msg.sender, msg.sender, amount);
    return true;
}
