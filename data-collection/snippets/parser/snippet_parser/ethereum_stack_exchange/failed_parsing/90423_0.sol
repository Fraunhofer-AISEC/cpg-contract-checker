function getAbonacci(uint yclose, ufixed128x18 dclose) public payable {
   if (provable_getPrice("URL") > address(this).balance) {
       emit LogNewProvableQuery("Provable query was NOT sent, please add some currency to cover for the query fee");
   } else {
       emit LogNewProvableQuery("Provable query was sent, standing by for the answer..");

       
       s2 = uint2str(yclose);
       
       
       x1 = string(dclose);
       
       s4 = string(abi.encodePacked(s1, "yclose=" , s2 , "&dclose=" , s3));
       
       provable_query("URL", string(s4));
   }
