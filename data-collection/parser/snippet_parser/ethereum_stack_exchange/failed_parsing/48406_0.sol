    import "../math/SafeMath.sol";
    using SafeMath for uint256; 
    using SafeMath for uint16;

    uint16 public totalValid;
    uint256 public etherValue;

     function _calculatePayout() internal{
        require(this.balance > 0); 
        etherValue = this.balance.div(totalValid); 
    }
