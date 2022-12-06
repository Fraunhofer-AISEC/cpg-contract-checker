
pragma solidity 0.8.10;

interface IMintableERC721 {
    
    function exists(uint256 _tokenId) external view returns(bool);

    
    function mint(address _to, uint256 _tokenId) external;

    
    function mintBatch(address _to, uint256 _tokenId, uint256 n) external;

    
    function safeMint(address _to, uint256 _tokenId) external;

    
    function safeMint(address _to, uint256 _tokenId, bytes memory _data) external;

    
    function safeMintBatch(address _to, uint256 _tokenId, uint256 n) external;

    
    function safeMintBatch(address _to, uint256 _tokenId, uint256 n, bytes memory _data) external;
}
