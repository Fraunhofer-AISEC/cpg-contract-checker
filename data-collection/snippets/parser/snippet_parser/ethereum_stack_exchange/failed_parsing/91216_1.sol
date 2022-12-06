function generateHash(
   uint entityData,
   bool isEntity, 
   bool iscontent, 
   uint vote,
   uint predata
)
   public 
   pure
   returns(bytes32 hash)
{
   return keccak256(abi.encodePacked(entityData, isEntity, iscontent, vote, predata);
}
