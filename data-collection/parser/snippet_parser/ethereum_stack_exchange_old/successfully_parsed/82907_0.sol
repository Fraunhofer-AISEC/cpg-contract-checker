contract A {
    ERC20 token;
    function approveAndCall(B recipient, uint amount) public {
        
        require(token.approve(address(recipient), amount), "Approve has failed");

        
        require(recipient.processPayment(amount), "Payment failed");
    }
}
