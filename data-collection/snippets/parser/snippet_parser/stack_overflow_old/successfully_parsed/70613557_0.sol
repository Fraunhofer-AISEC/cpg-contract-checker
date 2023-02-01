
pragma solidity ^0.8.0;

interface IERC721 {
    function ownerOf(uint256 _tokenId) external returns (address);
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
}
interface CryptopunkInterface {
    function transferPunk(address _to, uint _tokenId) external;
}
