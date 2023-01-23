contract MyContract {
   PC[] public pcs;
   structure PC {
      string name,
      uint time
   }

   function checkTime(uint _pcid) public {
      uint memory a = pcs[_pcid];
      string memory b = pcs[_pcid];
      
   }
}
