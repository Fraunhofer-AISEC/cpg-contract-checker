import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract C {
  using strings for *;
  string public s;

  function foo(string s1, string s2) {
    s = s1.toSlice().concat(s2.toSlice());
  }
}
