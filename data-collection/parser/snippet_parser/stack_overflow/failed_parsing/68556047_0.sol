pragma solidity ^0.8.0;
contract TimeLockedMint {
    
    uint alreadyMinted = 0;
    uint constant FIRST_MINTING_DATE = 1630454400; 1 Sep 2021
    uint constant SECOND_MINTING_DATE = 1661990400; 1 Sep 2022
    uint constant FIRST_MINTING_AMOUNT = 1;
    uint constant SECOND_MINTING_AMOUNT = 2; 

    function mint() public {
        if(block.timestamp > SECOND_MINTING_DATE) _mint(SECOND_MINTING_AMOUNT - alreadyMinted);
        else if(block.timestamp > FIRST_MINTING_DATE) _mint(FIRST_MINTING_AMOUNT - alreadyMinted);
        else revert('No more tokens can be minted');
    }
    
    function _mint(uint amount) internal{
        alreadyMinted += amount;
        
        
    }

}
