function getBatchDetails(uint row) public view returns(uint, string, address, string, string) {
   
   
   Batch storage b = batchArray[row]; 
   return(b.batchId, b.batchCreationDate, b.batchOwner, b.batchOrigin, b.productName);
}
