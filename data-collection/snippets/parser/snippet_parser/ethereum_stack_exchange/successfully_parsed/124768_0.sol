

pragma solidity ^0.8.0;

contract Test {

    struct Tx {
      uint amountOut;
      uint amountIn;
      uint40 time;
      address receiver;
   }

   mapping(address => Tx[]) userTxs;

    receive() payable external {

        Tx memory newTx = Tx({
            amountOut: 0,
            amountIn: msg.value,
            time: uint40(block.timestamp),
            receiver: address(this)
        });

        userTxs[msg.sender].push(newTx);
    }

    function transfer(address to, uint value) external {
        Tx memory newTx = Tx({
            amountOut: value,
            amountIn: 0,
            time: uint40(block.timestamp),
            receiver: to
        });

        userTxs[address(this)].push(newTx);
        payable(to).transfer(value);
    }

    function getUserTxs(address user) external view returns(Tx[] memory) {
        return userTxs[user];
    }
}
