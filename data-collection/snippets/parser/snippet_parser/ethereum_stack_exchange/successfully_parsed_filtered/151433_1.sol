
pragma solidity ^0.8.12;

interface INftTemplate {
    function safeMint(
        address to,
        string memory _uri,
        bool _isTransferable 
    ) external;

    function getNextTokenIdCounter() external view returns (uint256);

    function isNftTransferable(uint256 _tokenId) external view returns (bool);

    function contractURI() external view returns (string memory);

    function contractOwner() external view returns (address);

    function safeTransferFromWrapper(
        address _from,
        address _to,
        uint256 _tokenId
    ) external;

    function safeTransferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external;

    function getType() external view returns (string memory);
}

