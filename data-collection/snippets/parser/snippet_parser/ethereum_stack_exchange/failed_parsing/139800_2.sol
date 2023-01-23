
const walletAddress = "0x8197b2a89d80010019718e799e1224d4f2b429Ef";


const metadatas = [{
  name: "Cool NFT #1",
  description: "This is a cool NFT",
  image: fs.readFileSync("path/to/image.png"), 
}, {
  name: "Cool NFT #2",
  description: "This is a cool NFT",
  image: fs.readFileSync("path/to/other/image.png"),
}];

const tx = await contract.mintBatchTo(walletAddress, metadatas);
const receipt = tx[0].receipt; 
const firstTokenId = tx[0].id; 
const firstNFT = await tx[0].data(); 
