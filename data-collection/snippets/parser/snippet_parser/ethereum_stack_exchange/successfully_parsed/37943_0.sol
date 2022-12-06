contract Calc {
      function add(uint a, uint b) public returns(uint) {
                return adder(a,b);
             }
      function adder(uint a, uint b) public returns(uint) {
                return (a+b);
          }

}
