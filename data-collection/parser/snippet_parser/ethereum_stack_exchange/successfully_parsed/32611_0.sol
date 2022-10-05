function pay(address payee, uint value) public {
    
    payee.transfer(value);
}
