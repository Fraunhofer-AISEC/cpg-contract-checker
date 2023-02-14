export const signMessage = (
  account: SignerWithAddress,
  contractAddress: string,
  chainId: number
) => {

  const hash = ethers.utils.arrayify(
    ethers.utils.solidityKeccak256(['address', 'uint256'], [contractAddress, chainId])
  )

  return account.signMessage(
    `Hello, this is Bob. I am verifying ownership of your wallet.\n\nHash: ${ethers.utils.hexlify(
    hash,
  )}`);
};
