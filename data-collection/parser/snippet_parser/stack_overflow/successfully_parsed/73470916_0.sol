function SetTokenURIs(uint256[] memory IntIndex, string memory addURIs) public onlyAdminOwner{
    for(uint256 i =0; i < IntIndex.length;i++){
        uint256 Ind = IntIndex[i];
        bytes memory isEmpty = bytes(_tokenURIs[Ind]); 
        require(isEmpty.length == 0 ,"This List someone has been Exist cannot be set");
        _tokenURIs[Ind] = addURIs;
        tokenURI_count++;
    }
}
