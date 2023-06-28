
pragma solidity ^0.4.18;

import 'https://github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/ERC20.sol';
import 'https://github.com/OpenZeppelin/zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol';
import 'https://github.com/OpenZeppelin/zeppelin-solidity/contracts/crowdsale/distribution/RefundableCrowdsale.sol';

contract DeveloperToken is ERC20 {

}   

contract DeveloperCrowdsale is CappedCrowdsale, RefundableCrowdsale {
}
