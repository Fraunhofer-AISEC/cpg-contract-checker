contract User {
    address public userAddress;
    NFT private nftInstance;

    constructor (address _userAddress, NFT _nftInstance) {
        userAddress = _userAddress;
        nftInstance = _nftInstance;
    }

    event Collect(string tokenURI);

    function collect() public{
        uint256 tokenId = nftInstance.createNFT(userAddress);
        emit Collect(nftInstance.tokenURI(tokenId));
    }

    function getMyNFTs() public {
        mapping(address => uint256) storage tokenIdsCount = nftInstance.userAddressToTokenId; 
        uint256[] memory tokenIds = nftInstance.userAddressToTokenId[userAddress]; 
    }
}
