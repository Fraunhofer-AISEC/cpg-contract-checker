   
   const price_lottery = ethers.BigNumber.from(1);
   let owner;
   let Lottery;
   let lottery;

  before(async function () {
      Lottery = await ethers.getContractFactory("Lottery");
      [owner] = await ethers.getSigners();
      lottery = await Lottery.deploy(
          price_lottery,
      );

      
      await lottery.start_new_lottery(60);

  });

   it("should start a chainlink alarm to init new lottery", async func

       let lottery_state = await lottery.lottery_state();

       expect(lottery_state).to.equal(0);

       
       let lotteryId = await lottery.lotteryId();
      expect(lotteryId).to.equal(1);
  })

  it("increments lotteryID + 1, when chainlink alarm is fulfilled aft

      
      function timeout(ms) {
           return new Promise(resolve => setTimeout(resolve, ms));
       }

       await timeout(120000);

       
       let lotteryId = await lottery.lotteryId();
       expect(lotteryId).to.equal(2);
   })
