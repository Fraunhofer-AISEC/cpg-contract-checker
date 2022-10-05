
pragma solidity 0.8.4;
import "./FUDXToken.sol";
contract AirdropFudx is FUDX  {
    IERC20 private token;
     constructor (FUDX _token) {
        (admin) = payable(msg.sender);
        token  = _token;
     }
     address[]  registered;
     uint256 public count;
     
     function register() external {
        count++;
        registered.push(msg.sender);
     }
     
     modifier onlyOwner{
      require (msg.sender == admin, "Only Admin");
      _;
     }
     uint256 tokenAmount;
     function setTokenAmount(uint256 _tokenamount) external onlyOwner {
         tokenAmount = _tokenamount;
         uint256  num = registered.length;

         for( uint i=0; i<registered.length; i++) {
            approve(registered[i], tokenAmount);  
         }
     }
     
     function claimAirdrop() external returns(bool success) {
         token.transferFrom(admin, msg.sender, tokenAmount);    
         return true;
     }
}
