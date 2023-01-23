function getCustomer(address _address) view public returns (Customer memory) {

     return customers[_address]; 

}
