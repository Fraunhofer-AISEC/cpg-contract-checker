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
