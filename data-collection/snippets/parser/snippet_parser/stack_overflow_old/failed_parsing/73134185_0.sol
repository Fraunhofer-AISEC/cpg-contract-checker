
pragma solidity ^0.8;

import {SafeERC20} from '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import {Address} from '@openzeppelin/contracts/utils/Address.sol';
contract LendingPool 
{
  interface IL1ERC20Bridge{
    event ERC20DepositInitiated(
        address indexed _l1Token, address indexed _l2Token,
        address indexed _from, address _to, uint256 _amount, bytes _data);


    event ERC20WithdrawalFinalized(
        address indexed _l1Token, address indexed _l2Token,
        address indexed _from, address _to, uint256 _amount, bytes _data);
  }
