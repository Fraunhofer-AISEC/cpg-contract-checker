pragma solidity >=0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Test.sol";

contract MintToken is ERC20, Test {
    uint256 private _initialSupply = 1000 * 10**4 * 10**18;

    constructor(string memory tokenname) ERC20(tokenname, "VCY") {
        _mint(msg.sender, _initialSupply);
    }

    
    
    function whitelistMint(
        address _addr,
        bytes32[] memory proof,
        uint256 _amount
    ) external {
        require(verify(proof) == true);
        _mint(_addr, _amount);
    }

    function withdrawRemain() public onlyOwner {
        uint256 amount = address(this).balance;
        _transfer(address(this), msg.sender, amount);
    }

    function getName() public pure returns (string memory) {
        return "Victory";
    }
}
