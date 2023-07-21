pragma solidity ^0.8.2;

contract NFTFactory
{
    event NFTContractCreated (address nftContract, address owner, string baseURI);

    string public constant NFT_CONTRACT_CREATION = "NFT_CONTRACT_CREATION";
    address public immutable implementation;

    constructor(
        address _implementation
        )
    {
        implementation = _implementation;
    }

    function getImpl() public view returns(address) {
        return implementation;
    }
}
