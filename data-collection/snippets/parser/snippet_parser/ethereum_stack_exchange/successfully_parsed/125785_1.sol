pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(address _manager) ERC20("MyToken", "MTK") {
        _mint(_manager, 500 * 10 ** decimals());
    }
   
    function testTra(address _to, uint _amount) external{
        transfer(_to,_amount);
    }
}


contract ManagerContract {
    address public myTokenAddress;
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier addressIsNotEmpty() {
        require(myTokenAddress != address(0), "Address is empty!");
        _;
    }

    function setMyTokenAddress(address _myTokenAddress) public onlyOwner {
        myTokenAddress = _myTokenAddress;
    }

    function testTra(address _to, uint _amount) public addressIsNotEmpty {
        (bool success, ) = myTokenAddress.call(abi.encodeWithSignature("testTra(address,uint256)",_to,_amount));

    }
}
