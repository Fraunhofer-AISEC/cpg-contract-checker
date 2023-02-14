contract Foo {
   enum Letter {A, B, C}
   function say(uint index) returns (Letter) {
       if(index == 0) return Letter.A;
       if(index == 1) return Letter.B;
       if(index == 2) return Letter.C;
       throw;
   }
}
