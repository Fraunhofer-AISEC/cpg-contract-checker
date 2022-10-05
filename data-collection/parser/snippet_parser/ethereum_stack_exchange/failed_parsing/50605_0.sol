contract CustomToken is ERC20 {

    public symbol = “TEST”
    public totalSupply = X;
    public balanceOf...

    
    

    
    function placeOrderBuy(int _amountToken, int _maxPrice ) external payable 
            returns(bool success); 

    
    function placeOrderSell(int _amountToken, int _minPrice ) external 
            payable returns(bool success); 

    
    executeOrders() private returns(float newPrice);

    
    transfer(address _to, uint _value) private returns(bool success);
}
