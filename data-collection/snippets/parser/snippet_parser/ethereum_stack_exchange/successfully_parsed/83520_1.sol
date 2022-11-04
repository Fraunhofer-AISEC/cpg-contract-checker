pragma solidity >=0.4.22 <0.7.0;

import 'Token.sol';

contract BuyFrom {
    address payable private token;

    constructor(address payable _token) public {
        token = _token;
    }

    function buyToken(address contributor) external payable {
       InterfaceToken(token).invest(contributor);
    }
}
