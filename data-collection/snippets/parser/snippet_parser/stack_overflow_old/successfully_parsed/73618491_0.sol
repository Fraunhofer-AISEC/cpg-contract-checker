
pragma solidity ^0.8.0;
 
import "https://github.com/nibbstack/erc721/blob/master/src/contracts/tokens/nf-token-metadata.sol";
 
contract myNFT is NFTokenMetadata {

    uint tokenId = 0;

    string[] nfts = ["https://ipfs.io/ipfs/bafybeibnsoufr2renqzsh347nrx54wcubt5lgkeivez63xvivplfwhtpym/metadata.json"];
 
     function mint() public payable {
         require(msg.value == 100, "Send 100 Wei");
         super._mint(msg.sender, tokenId);
         super._setTokenUri(tokenId, nfts[0]);
         tokenId++;
    }
 
}
