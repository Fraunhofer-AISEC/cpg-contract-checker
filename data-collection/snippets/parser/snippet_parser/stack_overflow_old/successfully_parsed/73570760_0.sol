

pragma solidity ^0.8.4;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

contract MyNFT is Ownable {

    function payToStartGame(uint256 player) external payable {

        payable(owner()).transfer(msg.value);

        if (player > 10) {
          revert("Game started, try again later");
        }
    }

}
