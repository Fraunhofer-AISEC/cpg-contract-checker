pragma solidity >=0.6.0 <0.7.0;

contract userDataBase {

    constructor() public {        
    }

    function getOrderList(
        uint8 _status
        ) 
    public 
    pure
    returns (
        address[] memory,
        uint256[] memory         
        ) 
    {
        uint amount;         
        require(_status >= 0 && _status <= 6);

        amount=0;
        require(amount > 0, "State not includes orders");
        address[] memory userAddr = new address[](amount); 
        uint256[] memory orderIDs = new uint256[](amount);
        return(userAddr, orderIDs); 
    }
}
