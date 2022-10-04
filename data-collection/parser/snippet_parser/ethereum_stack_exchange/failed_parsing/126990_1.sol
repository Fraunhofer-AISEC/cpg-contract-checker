describe("Job assignment to freelancer", function () {
    before(async function () {
    [jobOwner, freelancer] = await hre.ethers.getSigners();
      jobContract.createJob("Job2", ethers.utils.parseEther("1"), {
        from: jobOwner.address,
      });
    });
    it("Should emit event of job assignment", async function () {
      await jobContract.jobAssignment(2, {
        from: freelancer.address,
      });
      
    });
  });
