
"before all" hook for "Check that all functions and facets exist in the diamond":
     
NomicLabsHardhatPluginError: You are trying to create a contract factory for the contract ERC1155Facet, which is abstract and can't be deployed.
If you want to call a contract using ERC1155Facet as its interface use the "getContractAt" function instead.
at getContractFactoryByName (node_modules\@nomiclabs\hardhat-ethers\src\internal\helpers.ts:112:11)
at deployFacets (test\test.js:74:25)
at Context.<anonymous> (test\test.js:90:9)

