contract A() {
     function() {
          throw;
     }
}
contract B is A() {}
