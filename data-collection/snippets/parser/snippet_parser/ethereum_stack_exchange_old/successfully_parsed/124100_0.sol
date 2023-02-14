pragma solidity 0.5.17;


contract Airdrop is Ownable{
    using SafeMath for uint256;

    
    uint256 BIGNUMBER = 10**18;
    uint256 totalAirdropToken = 10000; 

    address public owner;
    IERC20 public airdropToken;

    uint256 public totalStakeToken; 
    address[] public receiverList; 
    uint256[] public airdropTokenList; 
    mapping(address => uint256) public stakeTokens; 
    mapping(address => uint256) public airdropTokens; 

    
    constructor(address _airdropTokenAddr) public {
      owner = msg.sender;
      airdropToken = IERC20(_airdropTokenAddr);
    }
    
    
    event Drop(address account, uint256 amount);

    
    function calculate(address _account) private view returns(uint256) {
      return (stakeTokens[_account]).div(totalStakeToken).mul(totalAirdropToken).mul(BIGNUMBER);
    }

    
    function saveUserTokens(address[] memory _recipients, uint256[] memory _amount) public onlyOwner {
        require(_recipients.length == _amount.length);
        receiverList = _recipients;

        for (uint i = 0; i < receiverList.length; i++) {
            require(_recipients[i] != address(0));
            totalStakeToken += _amount[i];
            stakeTokens[receiverList[i]] = _amount[i];
        }
    }

    
    function sendAirdropToken() public onlyOwner {
      for(uint i=0; i<receiverList.length; i++){
          airdropTokenList.push(calculate(receiverList[i]));
          airdropTokens[receiverList[i]] = calculate(receiverList[i]);
      }
    }

    
    function drop() public {
      IERC20(airdropToken).transfer(msg.sender, airdropTokens[msg.sender]);

      emit Drop(msg.sender, airdropTokens[msg.sender]);
    }

    function destroy() public onlyOwner {
      IERC20(airdropToken).transfer(msg.sender, IERC20(airdropToken).balanceOf(address(this)));

      selfdestruct(msg.sender);
    }

    function airdropOwnerBalance() public view returns (uint256) {
      return IERC20(airdropToken).balanceOf(address(this));
    }

    function airdropUserBalance(address _account) public view returns (uint256) {
      return IERC20(airdropToken).balanceOf(_account);
    }
}
