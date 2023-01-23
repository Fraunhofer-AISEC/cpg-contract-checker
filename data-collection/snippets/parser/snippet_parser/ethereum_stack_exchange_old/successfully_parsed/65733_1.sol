pragma solidity 0.5.1;
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721-token-receiver.sol";

contract AssetLocker is ERC721TokenReceiver {
    mapping (address => mapping(uint256 => address)) beneficialOwner;

    function unfreeze(ERC721 nftContract, uint256 tokenId) external {
        require(beneficialOwner[address(nftContract)][tokenId] == msg.sender);
        nftContract.safeTransferFrom(address(this), msg.sender, tokenId);
    }

    
    function onERC721Received(
        address,
        address from,
        uint256 tokenId,
        bytes calldata
    )
        external
        returns(bytes4)
    {
        beneficialOwner[msg.sender][tokenId] = from;
        return 0x150b7a02;
    }
}
