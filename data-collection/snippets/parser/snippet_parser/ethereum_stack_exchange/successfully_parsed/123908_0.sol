
pragma solidity ^0.5.16;

import "https://github.com/Uniswap/v2-core/blob/master/contracts/UniswapV2Pair.sol";
contract TestERC20 {

    address public _pair = address(0);
    constructor() public {
        
    }

    function getPreAddress() public view returns (
        address, address
    ) {
      address factory = address(this);
      address token0 = 0xCAFE000000000000000000000000000000000000; 
      address token1 = 0xF00D000000000000000000000000000000000000; 

      address pair = address(uint(keccak256(abi.encodePacked(
        hex'ff',
        factory,
        keccak256(abi.encodePacked(token0, token1)),
        hex'96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f'
      ))));      
      return (pair, _pair);
  }

  function createPair() public {
      require(_pair == address(0), 'Pair already created');
      address token0 = 0xCAFE000000000000000000000000000000000000; 
      address token1 = 0xF00D000000000000000000000000000000000000; 
      bytes memory bytecode = type(UniswapV2Pair).creationCode;
      bytes32 salt = keccak256(abi.encodePacked(token0, token1));
      address dep;
      assembly {
            dep := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
      _pair = dep;
  }
}
