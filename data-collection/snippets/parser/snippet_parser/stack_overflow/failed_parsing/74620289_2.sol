const abi = [
      "function balanceOf(address) public view returns (uint256)",
      ]


const NFT_ADDRESS = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d";
const nftContract = new ethers.Contract(NFT_ADDRESS, abi, wallet);
const balance = await nftContract.balanceOf(wallet.address);


