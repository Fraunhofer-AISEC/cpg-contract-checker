 contract ERC20{
 uint256 public totalSupply;
 string public name;
 string public symbol;
 mapping (address => uint256) public balanceOf;
 mapping (address => mapping(address => uint256)) allowance;

 constructor(string memory name_, string memory symbol_){
    name = name_;
    symbol = symbol_;
    _mint(msg.sender, 100);
    }
 function _mint(address to , uint256 amount) internal  {
    require(to != address(0),"ERC20: mint to the zero address");
    totalSupply += amount;
    balanceOf[to] = balanceOf[to] + amount;
}
 function transfer(address recipient, uint256 amount) external returns(bool){
    return _transfer(msg.sender, recipient, amount);
}
 function transferFrom(address sender, address recipient, uint256 amount) external      returns(bool){
    uint256 currentAllowance = allowance[sender][msg.sender];
    require(
        currentAllowance >= amount,
        "ERC20: transfer amount exceeds allowance"
    );
    allowance[sender][msg.sender] -= currentAllowance;

    return _transfer(sender, recipient, amount);
}
function approve(address spender, uint256 amount) external returns(bool){
    require( spender != address(0), "ERC20: approve to the zero address");

    allowance[msg.sender][spender] = amount;
    return true;
}
function _transfer(address sender,address recipient, uint256 amount) private returns(bool){
    require(recipient != address(0),"ERC20: transfer to the zero address");
    uint256 senderBalances = balanceOf[sender];
    require(senderBalances >= amount,"You don't have enough token");
    balanceOf[sender] = senderBalances - amount;
    balanceOf[recipient] += amount;

    return true;

}
}`
A test file: 
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers"
 import { expect } from "chai";
 import { ethers } from "hardhat";
 import { ERC20 } from "../typechain-types";
 describe("ERC20",function(){
 let ERC20: ERC20;
 let someaddress: SignerWithAddress;
 let someOtheraddress: SignerWithAddress;
 beforeEach(async function () {
 const ERC20ContractFactory = await ethers.getContractFactory("ERC20");
 ERC20 = await ERC20ContractFactory.deploy("Hello","SYM");
 await ERC20.deployed(); 
 someaddress = (await ethers.getSigners())[1];
 someOtheraddress = (await ethers.getSigners())[2];

  ;});
  describe('when i have 10 token', function() { 
  beforeEach(async function () {
    
    await ERC20.transfer(someaddress.address, 10);
   });  
  });
  describe("When i transfer 10 token", function(){
   it("should transfer tokens correctly", async function(){
    await ERC20.connect(someaddress).transfer(someOtheraddress.address,10)
    expect (
      await (await ERC20.balanceOf(someOtheraddress.address))).to.equal(10);
  });
})
}); `
