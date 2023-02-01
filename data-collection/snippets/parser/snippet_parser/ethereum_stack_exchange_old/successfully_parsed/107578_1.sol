import "utils.sol"
contract MyContract {
   using Utils for UtilsType;
   UtilsType state;

  function foo(uint extra) public {
    state.addExtra(extra);
  }
}
