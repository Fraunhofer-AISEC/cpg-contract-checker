contract MyCommerceContract {
    CustomerContract public Customer;

    constructor() {
       
       Customer = new CustomerContract();
    }

    
    function checkValueFromCustomer(address customerAddr) public returns (uint256) {
        uint256 balance = Customer(customerAddr).getUserBalance(msg.sender); 
        return balance;
    }
}
