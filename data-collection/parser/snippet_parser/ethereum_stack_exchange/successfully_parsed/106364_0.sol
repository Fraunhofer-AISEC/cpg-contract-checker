function () public payable { 
    if(address(d).balance >= deposited) {
        d.withdraw(deposited);
    } 
}
