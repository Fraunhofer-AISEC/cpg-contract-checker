pragma solidity ^0.4.19;

contract FirstContract
{
    address creator;
    uint256 priceOfATransaction = msg.value;
    uint256 totalAmount;
    address buyer;

    function FirstContract() public
    {
        creator = msg.sender;
    }

    function perSaleDetails() public
    {
        totalAmount += priceOfATransaction;
        
        priceOfATransaction = 0;
    }

    function sellerMoneey() public returns(bool)
    {
        if(msg.sender == creator){
            if(!creator.send(totalAmount)) {
                return false;
            }
        }
    }
}
