uint c = 0; 

for(uint i = 0; i < totalNumberOfProperties; ++i) {

   address currentOwner = baseContract.getLandOwner(i);

   if(currentOwner == address(0)){

      propertiesForSaleArray[c] = i;

      c = c + 1;

      
   }
}
