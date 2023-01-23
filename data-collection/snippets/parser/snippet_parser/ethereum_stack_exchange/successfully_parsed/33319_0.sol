pragma solidity 0.4.15;

contract Bought {
    address[] bought;

    
    function setBought()
    public
    {
        bought.push(msg.sender);
    }

    function getAllBought()
    public
    constant 
    returns(address[])
    {
        return bought;
    }
}
