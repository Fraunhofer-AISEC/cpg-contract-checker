event PaymentMade(string id);

function pay(string id) public payable {
    
    
    emit PaymentMade(id);
}


