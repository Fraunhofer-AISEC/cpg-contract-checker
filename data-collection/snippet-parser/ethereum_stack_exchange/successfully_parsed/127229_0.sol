struct customerId{
        address id;
        mapping(string=>uint) customerAmount;
        mapping(string=>uint) customerPayed; 
        bytes customer_address;
    }
function add() public { 
cosId memory a= cosId({
            id:msg.sender,
            cosAmount:123,
            cosPayed:123,
            customer_address:"abcd"
        });
}
