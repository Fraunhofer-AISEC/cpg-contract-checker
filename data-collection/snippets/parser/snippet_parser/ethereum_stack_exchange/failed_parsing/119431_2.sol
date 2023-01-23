import "RebaseLibrary.sol"
contract Controller {
  struct Rebase {
    uint rebase,
    uint elastic
  }

  using RebaseLibrary for Rebase;

  function a() {
    Rebase memory total;
    total.toBase();
    ...
  }
}
