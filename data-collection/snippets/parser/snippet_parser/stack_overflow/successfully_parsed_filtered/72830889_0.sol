pragma solidity ^0.8.11;

import "./hip-206/HederaTokenService.sol";
import "./hip-206/HederaResponseCodes.sol";

contract Minting is HederaTokenService {

    address tokenAddress;
    bytes metadata;
    string baseURI = "abc";
    uint64 mintPrice;

function mintNonFungibleToken(uint64 _amount) external payable {
        bytes[] memory nftMetadatas = generateBytesArrayForHTS(
            baseURI,
            _amount
        );
        (
            int256 response,
            uint64 newTotalSupply,
        ) = HederaTokenService.mintToken(tokenAddress, _amount, metadata);

        if (response != HederaResponseCodes.SUCCESS) {
            revert("Mint Failed");
        }
    }

    
    function generateAddressArrayForHTS(address _address, uint256 _items)
        internal
        pure
        returns (address[] memory _addresses)
    {
        _addresses = new address[](_items);
        for (uint256 i = 0; i < _items; i++) {
            _addresses[i] = _address;
        }
    }

    
    function generateBytesArrayForHTS(bytes memory _bytes, uint256 _items)
        internal
        pure
        returns (bytes[] memory _bytesArray)
    {
        _bytesArray = new bytes[](_items);
        for (uint256 i = 0; i < _items; i++) {
            _bytesArray[i] = _bytes;
        }
    }

}