contract Xyz {
       struct A {
              address x;
              string y;
        }
        mapping( string => A) someMap;
        function record(string y) {
             xAddress = How do i create an address?
            someMap[y] = A(xAddress, 'test')
      }
      getAddress(string y) public constant returns (address) {
             return someMap[y].x;
     }
}
