pragma solidity 0.4.24;

import "../interfaces/ERC20.sol";
import "./WETH9.sol";

contract SetupAccount {

address public exchangeAddress;
address public wethAddress;

constructor (
    address _exchangeAddress,
    address _wethAddress
) public {
    exchangeAddress = _exchangeAddress;
    wethAddress = _wethAddress;
}


function setup(
    address[] _tokenAddresses, 
    uint256[] _values
) public payable {
    for (uint i = 0; i < _tokenAddresses.length; i++) {
        _tokenAddresses[i].delegatecall(abi.encodeWithSignature("approve(address,uint256)", exchangeAddress, _values[i]));
    }

    if (msg.value != 0) {
        wethAddress.delegatecall(abi.encodeWithSignature("deposit()"));
    }
}
}