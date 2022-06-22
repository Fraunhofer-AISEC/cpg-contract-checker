function getassetOwnership(address owner, bytes32 asset_id) public view returns (bool){
   if(asset_map[owner].id == asset_id)
     {
       return true;
     }
   else
     {
       return false;
     }
}
