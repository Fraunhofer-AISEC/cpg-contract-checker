 function createNFTContract(bytes32 salt,string calldata name, string calldata 
 symbol,string calldata _tokenURI)external isRegisteredUser returns(address){
 NFT contractAddress = NFT(ClonesUpgradeable.cloneDeterministic(nftAddress, salt));
 contractAddress.initialize(msg.sender,name,symbol,_tokenURI);
 contractAddress.transferOwnership(msg.sender);
 }
