
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol"; 

contract ERC721LazyMintWith712 is ERC721, EIP712, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
        EIP712(name, "1.0.0")
    {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function _hash(address account, uint256 tokenId)
        internal
        view
        returns (bytes32)
    {
        return
            _hashTypedDataV4(
                keccak256(
                    abi.encode(
                        keccak256("NFT(uint256 tokenId,address account)"),
                        tokenId,
                        account
                    )
                )
            );
    }

    function _verify(bytes32 digest, bytes memory signature)
        internal
        view
        returns (bool)
    {
        return hasRole(MINTER_ROLE, ECDSA.recover(digest, signature));
    }

    function getAccountAddress(address account, uint256 tokenId, bytes calldata signature) external view returns(address) {
        return ECDSA.recover(_hash(account, tokenId), signature);
    }
}
