 function PayCredit(address payable payee, uint money, uint invoiceNum) public payable{
        require(msg.sender==owner, "only owner can invoke it");
        payee.transfer(address(this).balance);
        claims[payee][invoiceNum].isPayed = true;
    }


