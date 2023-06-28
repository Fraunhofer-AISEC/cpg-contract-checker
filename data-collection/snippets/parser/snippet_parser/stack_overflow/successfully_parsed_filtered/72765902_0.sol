
pragma solidity >=0.8.9 <0.9.0;

import "@divergencetech/ethier/contracts/crypto/SignatureChecker.sol";
import "@divergencetech/ethier/contracts/crypto/SignerManager.sol";
import "@divergencetech/ethier/contracts/erc721/BaseTokenURI.sol";
import "@divergencetech/ethier/contracts/erc721/ERC721ACommon.sol";
import "@divergencetech/ethier/contracts/erc721/ERC721Redeemer.sol";
import "@divergencetech/ethier/contracts/sales/FixedPriceSeller.sol";
import "@divergencetech/ethier/contracts/utils/Monotonic.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

interface ITokenURIGenerator {
    function tokenURI(uint256 tokenId) external view returns (string memory);
}


contract TestBirds is
    ERC721ACommon,
    BaseTokenURI,
    FixedPriceSeller,
    ERC2981,
    AccessControlEnumerable
{
    using EnumerableSet for EnumerableSet.AddressSet;   
    using ERC721Redeemer for ERC721Redeemer.Claims;
    using Monotonic for Monotonic.Increaser;

    
    bytes32 public constant EXPULSION_ROLE = keccak256("EXPULSION_ROLE");

    constructor(
        string memory name,
        string memory symbol,
        string memory baseTokenURI,
        address payable beneficiary,
        address payable royaltyReceiver
    )
        ERC721ACommon(name, symbol)
        BaseTokenURI(baseTokenURI)
        FixedPriceSeller(
            2.5 ether,
            Seller.SellerConfig({
                totalInventory: 10_000,
                lockTotalInventory: true,
                maxPerAddress: 0,
                maxPerTx: 0,
                freeQuota: 125,
                lockFreeQuota: false,
                reserveFreeQuota: true
            }),
            beneficiary
        )
    {
        _setDefaultRoyalty(royaltyReceiver, 1000);
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    
    function _handlePurchase(
        address to,
        uint256 n,
        bool
    ) internal override {
        _safeMint(to, n);
    }

    
    mapping(bytes32 => bool) public usedMessages;

    
    function mintPublic(
        address to,
        bytes32 nonce,
        bytes calldata sig
    ) external payable {
        signers.requireValidSignature(
            signaturePayload(to, nonce),
            sig,
            usedMessages
        );
        _purchase(to, 1);
    }

    function alreadyMinted(address to, bytes32 nonce)
        external
        view
        returns (bool)
    {
        return
            usedMessages[
                SignatureChecker.generateMessage(signaturePayload(to, nonce))
            ];
    }

    
    function signaturePayload(address to, bytes32 nonce)
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodePacked(to, nonce);
    }


    
    function _baseURI()
        internal
        view
        override(BaseTokenURI, ERC721A)
        returns (string memory)
    {
        return BaseTokenURI._baseURI();
    }

    
    ITokenURIGenerator public renderingContract;

    
    function setRenderingContract(ITokenURIGenerator _contract)
        external
        onlyOwner
    {
        renderingContract = _contract;
    }

    
    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        if (address(renderingContract) != address(0)) {
            return renderingContract.tokenURI(tokenId);
        }
        return super.tokenURI(tokenId);
    }

    
    function setRoyaltyInfo(address receiver, uint96 feeBasisPoints)
        external
        onlyOwner
    {
        _setDefaultRoyalty(receiver, feeBasisPoints);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721ACommon, ERC2981, AccessControlEnumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
