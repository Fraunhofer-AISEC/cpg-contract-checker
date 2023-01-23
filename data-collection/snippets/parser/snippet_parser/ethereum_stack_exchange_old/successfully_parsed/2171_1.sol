import 'dapple/test.sol';

contract ECRecoverTest is Test {
  function testRecovery() {
    bytes32 foobar = 0x38d18acb67d25c8bb9942764b62f18e17054f66a817bd4295423adf9ed98873e;
    uint8 v = 0x00;
    bytes32 r = 0x723841761d213b60ac1cbf063207cbeba6c2725bcaf7c189e63f13d93fc1dc07;
    bytes32 s = 0x789d1dd423d25f0772d2748d60f7e4b81bb14d086eba8e8e8efb6dcff8a4ae02;

    log_address(ecrecover(foobar, v, r, s));
  }
}
