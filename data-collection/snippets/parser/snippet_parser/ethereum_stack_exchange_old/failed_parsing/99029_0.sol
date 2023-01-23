

pragma solidity >=0.7.0 <0.9.0;


contract CappedHolding {
    
    uint256 public totalSupply;
    uint holdingCapPercent = 10;
    mapping(address => uint256) public balanceOf;
    
    function transfer(address _to, uint256 _amount) public {
        require(balanceOf(to)+_amount <= _getMaxHolding(), "Max holding cap breached.")
        
        
    }
    
    function _getMaxHolding() public view internal (uint256) {
        return  (totalSupply * holdingCapPercent) / 100;
    }
}
