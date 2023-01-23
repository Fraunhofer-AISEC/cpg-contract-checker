import { SimpleMath } from '.SimpleMath.sol';

contract TestSimpleMath {
  function add(uint a, uint b) external pure returns(uint) {
    return SimpleMath.add(a, b);
  }
}
