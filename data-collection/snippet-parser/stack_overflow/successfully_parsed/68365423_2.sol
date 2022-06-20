function getEmpsIndex(int empid) public view returns (uint256) {
   for (uint256 i = 0; i < emps.length; i++) {
       if (emps[i].empid == empid) {
           return i;
       }
   }

   revert('Did not find');
}
