pragma solidity 0.8.4;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC777/ERC777.sol';

contract MyToken is ERC777 {

    constructor(address[] memory defaultOperators)
        ERC777('MYTOKEN', 'MTK', defaultOperators) {
    }

}
