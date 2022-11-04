const { exptect } = require("chai");
const { ethers } = require("hardhat");

describe("contract test" () => {
  let contract;
  
   beforeEach(async () => {
    
    let Contract = await ethers.getContractFactory("Contract");
    await contract = Contract.deploy();
    await contract.deployed();
   });
   
   
   it("Should fail if var_1 is = 799", async () => {
   
      
      const tx = await contract.setVar1(799);
      await tx.wait();
      
      
      ...
   });
}