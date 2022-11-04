pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/math/SafeMath.sol';
import 'zeppelin-solidity/contracts/token/ERC20/ERC20.sol';

import '../util/BytesLib.sol';

contract Crowdsale {
    using SafeMath for uint256;
    using BytesLib for bytes;

    
    address public wallet;

    ERC20 public token;

    
    uint256 public weiRaised;

    function Crowdsale(address _wallet, ERC20 _token) public {
        require(_wallet != address(0));

        wallet = _wallet;
        token = _token;
    }

    function () external payable {
        buyTokens(msg.sender);
    }

    function buyTokens(address _beneficiary) public payable {

        bytes memory msgData = msg.data;
        bytes memory dataValue = msgData.slice(36, 32);
        uint256 weiAmount = dataValue.toUint(0);

        weiRaised = weiRaised.add(weiAmount);
      }   
}
