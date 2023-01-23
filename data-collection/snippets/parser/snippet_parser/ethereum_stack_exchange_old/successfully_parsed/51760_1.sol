contract test_pq {
       function test() public returns (int256){
         PQ memory pq;
         for (uint8 i = 0; i < 10; i++)
             pq.insert(i)
         return pq.get_min();
       }
}
