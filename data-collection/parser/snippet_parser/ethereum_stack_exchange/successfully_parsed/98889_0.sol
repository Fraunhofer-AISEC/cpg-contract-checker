
pragma solidity >=0.4.22 <0.9.0;

import Token from "../Token.sol";

contract MigrationToken {

  
  address public tokenV1;

  
  address public tokenv2;

  
  address public burnAddress = 0x000000000000000000000000000000000000dEaD;

  uint256 public endBlock;

  constructor(
    address _tokenV1,
    address _tokenV2,
    uint256 _endBlock

  ) public {
    tokenV1 = _tokenV1;
    tokenv2 = _tokenV2;
    endBlock = _endBlock;
  }

  event MigrateToV2(address indexed user,uint256 amount);

  function migratationNewToken(uint256 _inputAmt) public {

    require(block.number < endBlock, "too late :(");
    IERC20(tokenV1).safeTransferFrom(
      address(msg.sender),
      burnAddress,
      _inputAmt
    );

    Token(tokenv2).mint(msg.sender, _inputAmt);
    emit MigrateToV2(msg.sender,_inputAmt);
  }


}
