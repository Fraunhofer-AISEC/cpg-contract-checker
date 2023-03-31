const { ethers } = require("hardhat");
const { expect } = require("chai");
const { BigNumber } = require("ethers");

const provider = ethers.getDefaultProvider();

describe("Decentralized Slot Machine", async function () {
  let myContract;
  let hardhatVrfCoordinatorV2Mock;

  describe("Testing Decentralized Slot Machine", function () {
    
    it("Should deploy Slot Machine Contract", async function () {
      const SlotMachine = await ethers.getContractFactory("SlotMachine");
      let vrfCoordinatorV2Mock = await ethers.getContractFactory(
        "VRFCoordinatorV2Mock"
      );

      hardhatVrfCoordinatorV2Mock = await vrfCoordinatorV2Mock.deploy(0, 0);

      await hardhatVrfCoordinatorV2Mock.createSubscription();

      await hardhatVrfCoordinatorV2Mock.fundSubscription(
        1,
        ethers.utils.parseEther("7")
      );

      myContract = await SlotMachine.deploy(
        1,
        hardhatVrfCoordinatorV2Mock.address,
        {
          value: ethers.utils.parseEther("100"),
        }
      );

      await hardhatVrfCoordinatorV2Mock.addConsumer(1, myContract.address);
    });

    
    describe("First Play - First Player", function () {
      it("Contract should receive random numbers", async () => {
        const [account1, account2] = await ethers.getSigners();

        let tx = await myContract.play(ethers.constants.AddressZero, {
          value: ethers.utils.parseEther("1"),
        });
        let { events } = await tx.wait();

        let [reqId] = events.filter((x) => x.event === "RequestedRandomness")[0]
          .args;

        await expect(
          hardhatVrfCoordinatorV2Mock.fulfillRandomWords(
            reqId,
            myContract.address
          )
        ).to.emit(myContract, "ReceivedRandomness");

        let round = await myContract.rounds(reqId);

        expect(round.userAddress).to.be.equal(account1.address);
        expect(round.number1).to.be.equal(1);
        expect(round.number2).to.be.equal(9);
        expect(round.number3).to.be.equal(6);
      });       

    });
  });
});
