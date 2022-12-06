pragma solidity ^0.6.1;
import "TetherToken.sol";
contract L {
    address payable TetherAddress = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    TetherToken Tether = TetherToken(TetherAddress);
    ...
}
