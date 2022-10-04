contract TestTransfer {
function deposit(address payable wtrxAddr) public payable{
    WTRX wtrx = WTRX(wtrxAddr);

    
    wtrx.deposit.value(msg.value)();

    
    wtrx.transfer(msg.sender, msg.value);
}

function withdraw(address payable wtrxAddr, uint sad) public{
    WTRX wtrx = WTRX(wtrxAddr);

    
    wtrx.transferFrom(msg.sender, address(this), sad);

    
    wtrx.withdraw(sad);
    
    
    msg.sender.transfer(sad);
}

function both(address payable wtrxAddr) public payable{
    WTRX wtrx = WTRX(wtrxAddr);
    
    wtrx.deposit.value(msg.value)();
    
    
    wtrx.withdraw(msg.value);

    
    msg.sender.transfer(msg.value);
}
}