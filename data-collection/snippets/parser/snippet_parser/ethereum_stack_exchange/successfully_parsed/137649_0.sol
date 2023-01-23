
import "github.com/Arachnid/solidity-stringutils/src/strings.sol";

contract Contract {
    using strings for *;

    var s = "foo bar baz".toSlice();
    var foo = s.split(" ".toSlice());
}
