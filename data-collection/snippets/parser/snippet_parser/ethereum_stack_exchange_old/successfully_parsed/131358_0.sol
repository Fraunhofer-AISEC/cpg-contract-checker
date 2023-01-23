contract MyContract{

   struct artist {
      string name;
      string[] songNames;
   }
   
   mapping(address => artist) artists;

   function checkDefaultValue() public view returns (uint256) {
      return bytes(artists[msg.sender].name).length;
   }

}
