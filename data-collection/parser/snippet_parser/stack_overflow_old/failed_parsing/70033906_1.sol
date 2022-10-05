import "./FirstContract.sol";

contract SecondContract {
    FirstContract firstContract;

    constructor(address _address) {
        firstContract = FirstContract(_address);
    }

    
    function createToken() external {
        firstContract.incrementToken();
        uint256 newTokenId = firstContract.currentToken();
        firstContract.mint(msg.sender, newTokenId); 
    }
   
    
    function transferToken(from address, address to, uint256 tokenId) external {
        
        firstContract.transferFrom(from, to, tokenId); 
    }
}
