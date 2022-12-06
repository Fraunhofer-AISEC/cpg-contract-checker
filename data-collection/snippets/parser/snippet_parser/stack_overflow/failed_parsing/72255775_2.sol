await contract.mintListed(1, merkleProof, 5, { value: ethers.utils.parseEther("0.25") });
=> "Error: VM Exception while processing transaction: reverted with reason string 'Invalid proof'"
