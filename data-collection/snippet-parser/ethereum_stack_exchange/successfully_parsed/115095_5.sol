 
    import "./ERC20.sol";
    
    
    contract NFT is ERC721URIStorage {
        using Counters for Counters.Counter;
        Counters.Counter private _tokenIds;
        address contractAddress;
    
        
        ERC20 public tokenContract;
    
        constructor(address marketplaceAddress, ERC20 _tokenContract) ERC721("My NFT", "MNFT") {
            contractAddress = marketplaceAddress;
    
            
            tokenContract = _tokenContract;
            }
    function RandomFunction() public returns(uint256){
    
        return tokenContract.balanceOf(msg.sender);
    }

}
