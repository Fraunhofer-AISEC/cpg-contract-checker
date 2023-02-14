
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/cryptography/ECDSAUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol";

contract Kargain is ERC721BurnableUpgradeable, AccessControlUpgradeable {
    using SafeMathUpgradeable for uint256;
    using ECDSAUpgradeable for bytes32;

    uint256 private constant COMMISSION_EXPONENT = 4;
    address payable private _platformAddress;
    uint256 private _platformCommissionPercent;

    mapping (uint => Token) private _tokens;
    mapping (uint256 => address payable) private _offer_vendor;
    mapping (uint256 => address payable) private _offers;
    mapping (uint256 => bool) private _token_exist;
    mapping (uint256 => bool) private _offer_claimed;
    mapping (uint256 => uint256) private _offers_closeTimestamp;

    event TokenMinted(address indexed creator, uint256 indexed tokenId);
    event OfferReceived(address indexed payer, uint tokenId);
    event OfferAccepted(address indexed payer, uint tokenId);
    event OfferRejected(address indexed payer, uint tokenId);

    struct Token {
        address owner;
        uint amount;
    }

    struct TransferType {
        address from;
        address to;
        uint256 tokenId;
        uint256 amount;
    }

    modifier onlyAdmin(){
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "Kargain: Caller is not a admin");
        _;
    }

    function initialize(address payable platformAddress_, uint256 platformCommissionPercent_)
    initializer public {
        _platformAddress = platformAddress_;
        _platformCommissionPercent = platformCommissionPercent_;
        __ERC721Burnable_init();
        __ERC721_init("Kargain", "KGN");
        __AccessControl_init();
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function platformCommissionPercent() public view returns(uint256){
        return _platformCommissionPercent;
    }

    function setPlatformCommissionPercent(uint256 _platformCommissionPercent_) public onlyAdmin {
        _platformCommissionPercent = _platformCommissionPercent_;
    }

    function platformAddress() public view returns(address payable){
        return _platformAddress;
    }

    function setPlatformAddress(address payable platformAddress_) public onlyAdmin {
        _platformAddress = platformAddress_;
    }

    function ownerOf(uint256 tokenId) public view override returns (address) {
        address owner = _tokens[tokenId].owner;
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    function mint(uint256 tokenId) public payable{
        require(!_token_exist[tokenId], "Kargain: Id for this token already exist");
        super._mint(msg.sender, tokenId);
        _tokens[tokenId].owner = msg.sender;
        _offers[tokenId] = payable(address(0));
        _offer_vendor[tokenId] = msg.sender;
        _token_exist[tokenId] = true;
        _offer_claimed[tokenId] = false;
        _tokens[tokenId].amount = msg.value;
        emit TokenMinted(msg.sender, tokenId);
    }

    function purchaseToken(uint256 _tokenId) public payable {
        require(_token_exist[_tokenId], "Kargain: Id for this token not exist");
        require(!_offer_claimed[_tokenId], "Kargain: Offer was claimed");
        require(_tokens[_tokenId].owner != msg.sender, "Kargain: You cannot buy your own token");
        require(_offers[_tokenId] == address(0), "Kargain: An offer is pending");
        require(msg.value == _tokens[_tokenId].amount, "Kargain: the offer amount is invalid");
        _offers_closeTimestamp[_tokenId] = block.timestamp;
        uint256 refundAmount = _tokens[_tokenId].amount;
        _offers[_tokenId] = payable(address(msg.sender));
        address payable refundAddress = _offers[_tokenId];
        refundAddress.transfer(refundAmount);
        emit OfferReceived(msg.sender, _tokenId);
    }

    function claimOffer(uint256 tokenId) public {
        require(_token_exist[tokenId], "Kargain: Id for this token not exist");
        require(!_offer_claimed[tokenId], "Kargain: Offer was claimed");
        require(_offers_closeTimestamp[tokenId] < block.timestamp, "Kargain: Offer has expired");
        _offer_claimed[tokenId] = true;
        uint256 platformCommission;
        platformCommission = (_tokens[tokenId].amount).mul(_platformCommissionPercent).div(10** COMMISSION_EXPONENT);
        safeTransferFrom(_offer_vendor[tokenId], , tokenId);
        _platformAddress.transfer(platformCommission);
        _offer_vendor[tokenId].transfer((_tokens[tokenId].amount).sub(platformCommission));
        _offer_vendor[tokenId] = _offers[tokenId];
    }

}

