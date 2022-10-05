  SampleNft
    1) "before each" hook for "should be able to return token name by token id"


  0 passing (2s)
  1 failing

  1) SampleNft
       "before each" hook for "should be able to return token name by token id":
     NomicLabsHardhatPluginError: The contract SampleNft is missing links for the following libraries:
* contracts/SampleNft.sol:TokenTrait

Learn more about linking contracts at https:

      at collectLibrariesAndLink (node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:258:11)
      at getContractFactoryFromArtifact (node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:149:32)
      at getContractFactory (node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:93:12)
      at Context.<anonymous> (test/sample-nft-test.js:13:29)
