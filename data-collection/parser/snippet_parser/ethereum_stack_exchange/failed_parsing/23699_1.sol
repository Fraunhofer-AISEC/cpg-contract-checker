 contract Xyz {
           struct A {
                  address x;
                  string y;
            }
            mapping( string => A) someMap;
            function record(string y) {
                 xAddress = msg.sender;
                someMap[y] = A(xAddress, 'test')
          }
          getAddress(string y) public constant returns (address) {
                 return someMap[y].x;
         }
    }
