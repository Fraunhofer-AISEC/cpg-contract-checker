contract coin_transfer_to {
    function() public payable {
    }
    function get_balance() public returns (uint)
    {
        returns address(this).balance;
    }
}

contract coin_transfer_from{
    coin_transfer_to private _instance;
    function coin_transfer_from () public
    {
        _instance = new coin_transfer_to();
    }
    
    function get_balance() public returns (uint)
    {
        return address(this).balance;
    }
    
    function get_balance_of_instance() public returns (uint)
    {
       return _instance.get_balance();
    }
    
    function () public payable 
    {
        address(_instance).send(msg.value);
    }
}
