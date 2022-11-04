contract RaceCondition{
    address private owner;
    uint public price;
    ERC20 token;

    function RaceCondition(uint _price, ERC20 _token)
        public 
    {
        owner = msg.sender;
        price = _price;
        token = _token;
    }

    
    
    
    
    function buy(uint new_price) payable
        public
    {
        require(msg.value >= price);

        
        
        token.transferFrom(msg.sender, owner, price);

        price = new_price;
        owner = msg.sender;
    }

    function changePrice(uint new_price){
        require(msg.sender == owner);
        price = new_price; 
    }

}
