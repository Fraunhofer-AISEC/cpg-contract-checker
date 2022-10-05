contract CutoutAuctions is Pausable, CutoutAuctionsBase {


bytes4 constant InterfaceSignature_ERC721 = bytes4(0x01ffc9a7);

   address payable nftAddress;
    ERC721 public candidateContract;

    constructor(address _nftContractAddress, uint256 _cut){

        require(_cut <= 10000);
        ownerCut = _cut;

        candidateContract = ERC721(_nftContractAddress);
        
        
        require(candidateContract.supportsInterface(InterfaceSignature_ERC721));
        nonFungibleContract = candidateContract;
    }

function createAuction(
        uint256 _tokenId,
        uint256 _startingPrice,
        uint256 _endingPrice,
        uint256 _duration,
        address _seller
    )
        external
        virtual
        whenNotPaused
    {

        require(_startingPrice == uint256(uint128(_startingPrice)));
        require(_endingPrice == uint256(uint128(_endingPrice)));
        require(_duration == uint256(uint64(_duration)));

        require(_owns(msg.sender, _tokenId));

        _escrow(msg.sender, _tokenId);
        Auction memory auction = Auction(
            payable(_seller),
            uint128(_startingPrice),
            uint128(_endingPrice),
            uint64(_duration),
            uint64(block.timestamp)
        );
        _addAuction(_tokenId, auction);
    }

}
