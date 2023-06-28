function supportsInterface(
    bytes4 interfaceId
) public view virtual override(ERC721A, ERC2981) returns (bool) {
    
    
    
    
    
    return 
        ERC721A.supportsInterface(interfaceId) || 
        ERC2981.supportsInterface(interfaceId);
}
