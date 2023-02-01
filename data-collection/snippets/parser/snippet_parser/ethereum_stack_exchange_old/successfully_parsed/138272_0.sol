
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

import "./IERC721OffchainPermit.sol";

error ERC721OffchainPermit__UnknownToken();
error ERC721OffchainPermit__PermitDeadlineExpired();
error ERC721OffchainPermit__ZeroAddress();
error ERC721OffchainPermit__InvalidPermitSignature();

contract ERC721OffchainPermit is ERC721 {

    bytes32 private constant DOMAIN_TYPE_HASH =
        keccak256(
            "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
        );
    bytes32 private constant PERMIT_TYPE_HASH =
        keccak256(
            "permitToApprove(address spender,uint256 tokenId,uint256 nonce,uint256 deadline)"
        );
    string private constant DOMAIN_VERSION = "1";

    bytes32 private immutable _domainSeparator;
    uint256 private immutable _domainChainId;
    uint256 private tokenCounter;

    
    mapping(uint256 => uint256) private _nonces;

    
    event PermitApplied(address spender, uint256 tokenId);
    event SafeTransferWithPermitExecuted(address from, address to, address sender);
    event Recovery(address recoveredAddress, address spender, ECDSA.RecoverError error);
    event DigestOutput(bytes32 _digest);
    event DigestInput(address spender, uint256 tokenId, uint256 nonce, uint256 deadline);

    constructor() ERC721("TEST NFT WITH PERMIT", "TNFTP") {
        uint256 chainId;
        
        assembly {
            chainId := chainid()
        }
        _domainChainId = chainId;
        _domainSeparator = _calculateDomainSeparator(chainId);
    }

    
    
    

    function safeTransferFromAndPermit(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data,
        uint256 deadline,
        bytes memory signature
    ) external {
        
        permitToApprove(to, tokenId, deadline, signature);
        
        emit SafeTransferWithPermitExecuted(from, to, msg.sender);
        safeTransferFrom(from, to, tokenId, _data);
    }

    function permitToApprove(
        address spender,
        uint256 tokenId,
        uint256 deadline,
        bytes memory signature
    ) public {
        if (deadline < block.timestamp) {
            revert ERC721OffchainPermit__PermitDeadlineExpired();
        }
        emit DigestInput(spender, tokenId, _nonces[tokenId], deadline);
        bytes32 digest = _buildDigest(spender, tokenId, _nonces[tokenId], deadline);
        emit DigestOutput(digest);
        (address recoveredAddress, ECDSA.RecoverError err) = ECDSA.tryRecover(digest, signature);

        emit Recovery(recoveredAddress, spender, err);
        if (recoveredAddress == address(0) || spender == address(0)) {
            revert ERC721OffchainPermit__ZeroAddress();
        }
        if (
            !_isApprovedOrOwner(recoveredAddress, tokenId) ||
            !SignatureChecker.isValidSignatureNow(ownerOf(tokenId), digest, signature)
        ) {
            revert ERC721OffchainPermit__InvalidPermitSignature();
        }
        _approve(spender, tokenId);
        emit PermitApplied(spender, tokenId);
    }

    function _buildDigest(
        address spender,
        uint256 tokenId,
        uint256 nonce,
        uint256 deadline
    ) public view returns (bytes32) {
        return
            ECDSA.toTypedDataHash(
                getDomainSeparator(),
                keccak256(abi.encode(PERMIT_TYPE_HASH, spender, tokenId, nonce, deadline))
            );
    }

    function _incrementNonce(uint256 _tokenId) internal {
        _nonces[_tokenId]++;
    }

    function mint() public {
        uint256 tokenId = tokenCounter;
        tokenCounter++;
        _mint(msg.sender, tokenId);
    }

    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        _incrementNonce(tokenId);
        super._transfer(from, to, tokenId);
    }

    
    
    

    function _calculateDomainSeparator(uint256 _chainId) internal view returns (bytes32) {
        return
            keccak256(
                abi.encode(
                    DOMAIN_TYPE_HASH,
                    keccak256(bytes(name())),
                    keccak256(bytes(DOMAIN_VERSION)),
                    _chainId,
                    address(this)
                )
            );
    }

    
    
    

    function getNonce(uint256 _tokenId) public view returns (uint256) {
        
        if (!_exists(_tokenId)) {
            revert ERC721OffchainPermit__UnknownToken();
        }
        return _nonces[_tokenId];
    }

    function getDomainSeparator() public view returns (bytes32) {
        uint256 chainId;
        
        assembly {
            chainId := chainid()
        }

        return (chainId == _domainChainId) ? _domainSeparator : _calculateDomainSeparator(chainId);
    }

    function getTokenCounter() public view returns (uint256) {
        return tokenCounter;
    }

    function getVersion() public pure returns (string memory) {
        return DOMAIN_VERSION;
    }

    
    
    

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return
            interfaceId == type(IERC721OffchainPermit).interfaceId || 
            super.supportsInterface(interfaceId);
    }
}

