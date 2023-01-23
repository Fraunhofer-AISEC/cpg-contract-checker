

pragma solidity >=0.7.0 <0.9.0;


contract Gifter {

    address private gifter;
    
    
    
    event OwnerSet(address indexed gifter, address indexed giftRecipient);
    
    
    modifier isGifter() {
        require(msg.sender == gifter, "Gift NOT yours to give away!");
        _;
    }
    
    
    constructor() {
        gifter = msg.sender; 
        emit OwnerSet(address(0), gifter);
    }

    
    function giftTo( address giftRecipient ) public isGifter {
        emit OwnerSet(gifter, giftRecipient);
        
        giftRecipient = giftRecipient;
    }

    
    function whoWasGifted() external view returns (address) {
        return giftRecipient;
    }
}
