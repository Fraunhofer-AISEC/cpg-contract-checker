modifier onlyCEOOrCOO {
     Organization memory _organization = organizations[addressToOrgId[msg.sender]];
     require(
       msg.sender == _organization.cooAddress ||
       msg.sender == _organization.ceoAddress
     );
     _;
   }

function something () external onlyCEOOrCOO {
    
    
}
