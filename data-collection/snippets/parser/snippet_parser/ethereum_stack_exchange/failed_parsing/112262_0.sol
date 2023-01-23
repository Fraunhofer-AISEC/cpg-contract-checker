contract idea is ERC20,ERC721{
.
.
.
}
 


 So what i did for that purpose
    
    I have 3 contracts '1' is main.sol  where i'm importing my '2' other contracts Erc.sol and NFT.sol
    ------- main.sol -------

    SPDX-License-Identifier: Unlicense
    pragma solidity 'some version';
    import "./NFT.sol";
    import "./ERc.sol";
    contract main  {
    
          ERc erc =new ERc();
    
       constructor(uint256 _initialSupply)  {
          
     erc.addInitialSupply(_initialSupply);
        
    }
    
        
        NFT nft = new NFT();
      
     
    } 
