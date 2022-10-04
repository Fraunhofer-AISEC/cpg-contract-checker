
pragma solidity >=0.7.0;


contract ERC20 {

    string public name = "Token";
    string public symbol = "Symbol";
    uint256 public totalSupply;

    
    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply) {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

}
