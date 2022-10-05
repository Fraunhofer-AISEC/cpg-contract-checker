 function test() public returns (bytes30 outs) {

     bytes memory outmasks = hex"0c0b0c0e1708090907030605131306060406060009060d0e130207040000000c1708080a060e0e0904050605140b0c0b";

     for (uint8 cnt = 0; cnt<47; cnt++) {
         outs |= bytes30(outmasks[cnt]) >> (232 - 5 *cnt);
     }
     outs |= bytes30(outmasks[47]) << 3;
 }
