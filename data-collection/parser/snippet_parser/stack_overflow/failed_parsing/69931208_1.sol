TypeError: Cannot override public state variable.
 --> contracts/mocks/StakePoolMock.sol:4:5:
  |
4 |     uint256 public constant X = 1;
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overriding public state variable is here:
 --> contracts/mocks/StakePoolMock.sol:8:5:
  |
8 |     uint256 override public constant X = 2;
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
