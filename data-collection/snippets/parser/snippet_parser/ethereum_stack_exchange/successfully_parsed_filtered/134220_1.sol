contract BatchSendERC20 {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    address public owner;

    modifier onlyOwner(){
       require(msg.sender == owner);
       _;
    }

    constructor() public{
       owner = msg.sender;
    }

    
    function getOwner() public view returns (address) {
        return owner;
    }

    
    function getTokenBalance(IERC20 token) public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    function totalSend(uint256[] memory amounts) internal pure returns(uint256) {
          uint256 length = amounts.lebngth;
          uint256 totalAmount;
      for(uint256 i=0; i < length; i++) {
        totalAmount += amounts[i];
      }
      return totalAmount
    }
    
    function multiSendDiffTokenFromContract(IERC20 token, address[]     memory recipients, uint256[] memory amounts) public onlyOwner {
    
        require(recipients.length > 0);
        require(recipients.length == amounts.length);
    
        uint256 length = recipients.length;
        uint256 totalToSend = totalSend(amounts);
        uint256 currentTokenBalance = token.balanceOf(address(this));
        require(currentTokenBalance >= totalToSend)
        for (uint256 i = 0; i < length; i++) {
            uint256 amount = amounts[i];
            require(amount > 0);
            token.safeTransfer(recipients[i], amount);
        }
    }

}
