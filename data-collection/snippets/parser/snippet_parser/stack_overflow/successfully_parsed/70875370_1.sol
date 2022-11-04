

pragma solidity >=0.7.0 <0.9.0;

import './DEXUserCoin.sol';

contract DEXTransferCoinUserToUser {

    DEXUserCoin private desxUserCoin;

    constructor(){}

    function TransferUserToUser(address from , address to ,uint coinId ,  uint256 amount) 
    public view returns(bool) {

      return  desxUserCoin.ApproveTransferSend(from,coinId,amount);

    }

}
