pragma solidity >= 0.8.4;

contract EnumTest {
    
    address private _owner;
    
    enum ErrStatus {
        NO_ERROR,
        ERR_PLAYER_REQUIRED,
        ERR_OWNER_REQUIRED
    }
    
    uint256 private _amount;
    
    error ErrHandle(uint8 errstatus);
    
    modifier OnlyOwner(){
        if(msg.sender != _owner)
            revert ErrHandle({errstatus:1});
        _;
    }
    
    modifier OnlyPlayer() {
        if(msg.sender == _owner)
            revert ErrHandle({errstatus:2});
        _;
    }
    
    constructor(){
        _owner = msg.sender;
    }
    
    
    function setAmount() public payable OnlyOwner returns (uint8) {
        _amount = msg.value;
        return uint8(ErrStatus.NO_ERROR);
    }
    
    
    function getAmount() public view OnlyPlayer returns (uint256) {
        return _amount;
    }
    
}
