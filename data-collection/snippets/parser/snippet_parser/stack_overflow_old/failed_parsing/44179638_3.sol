import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract Contract {
   using strings for *;

   

   function smt() {
    var s = ""This-Is-A-Problem"".toSlice();
    var delim = "-".toSlice();
    var parts = new string[](s.count(delim) + 1);

    for(uint i = 0; i < parts.length; i++) {
       parts[i] = s.split(delim).toString();
    }
   }
}
