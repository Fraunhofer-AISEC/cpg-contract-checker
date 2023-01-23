contract Escrow {
address public nftAddress;
address payable public seller;
address public inspector;
address public lender;

mapping(uint256 => bool) public isListed;
mapping(uint256 => uint256) public purchasePrice;
mapping(uint256 => uint256) public escrowAmount;
mapping(uint256 => address) public buyer;

constructor(
    address _nftAddress,
    address payable _seller,
    address _inspector,
    address _lender
) {
    nftAddress = _nftAddress;
    seller = _seller;
    inspector = _inspector;
    lender = _lender;
}

function list(
    uint256 _nftID,
    uint256 _purchasePrice,
    uint256 _escrowAmount,
    address _buyer
) public {
    
    IERC721(nftAddress).transferFrom(msg.sender, address(this), _nftID);

    isListed[_nftID] = true;
    purchasePrice[_nftID] = _purchasePrice;
    escrowAmount[_nftID] = _escrowAmount;
    buyer[_nftID] = _buyer;
}
}