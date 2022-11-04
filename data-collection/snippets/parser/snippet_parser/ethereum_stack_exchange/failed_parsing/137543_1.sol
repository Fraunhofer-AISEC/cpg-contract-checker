import { Signer } from "ethers";
import { ethers } from "hardhat";
import { HellowWorld } from "./../../typechain-types";


export async function deployHelloWorldFixture(): Promise<IHellowWorldFixture> {
  
  const [
    owner,
    manager,
    teamMemberA,
    teamMemberB,
    accountA,
    accountB,
    accountC,
    accountD,
    accountE,
  ] = await ethers.getSigners();

  const HelloWorldFactory = await ethers.getContractFactory("HellowWorld");
  const contract = await HelloWorldFactory.deploy("Hello, world!");

  return {
    contract,
    owner,
    manager,
    teamMemberA,
    teamMemberB,
    accountA,
    accountB,
    accountC,
    accountD,
    accountE,
  };
}

export type IHellowWorldFixture = {
  contract: HellowWorld;
  owner: Signer;
  manager: Signer;
  teamMemberA: Signer;
  teamMemberB: Signer;
  accountA: Signer;
  accountB: Signer;
  accountC: Signer;
  accountD: Signer;
  accountE: Signer;
};

