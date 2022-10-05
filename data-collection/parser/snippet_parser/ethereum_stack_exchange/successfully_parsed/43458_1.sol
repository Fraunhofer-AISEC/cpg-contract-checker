pragma solidity ^0.4.21;

contract MyToken {function transfer(address _to, uint256 _value) public; }

contract ADTest {

    function CallTransfer(address tokenAddress, address _to, uint256 _value) public {
        MyToken(tokenAddress).transfer(_to, _value);
    }

}
