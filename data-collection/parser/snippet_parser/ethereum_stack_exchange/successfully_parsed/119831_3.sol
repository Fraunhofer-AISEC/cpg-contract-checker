function find(uint index) public view returns (bool) {
   for(uint c = 0; c < winners.length; c++) {
       if (winners[c] == index) {
           return true;
       }
   }
   return false;
}
