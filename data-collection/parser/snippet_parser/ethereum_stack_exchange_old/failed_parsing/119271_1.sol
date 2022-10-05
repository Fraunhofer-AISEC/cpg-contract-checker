describe("BytesShift", function () {
  describe("shiftLeft", () => {
    it(`Should shift bytes to the left`, async function () {
      const BytesShift = await ethers.getContract("BytesShift");
      const res = await BytesShift.shiftLeft("0xff", 1);
      expect(res).to.equal("0xfe");
    });
  });
});
