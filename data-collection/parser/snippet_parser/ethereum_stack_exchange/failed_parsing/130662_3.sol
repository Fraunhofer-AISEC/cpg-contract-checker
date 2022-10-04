const { expectRevert } = require("@openzeppelin/test-helpers");
const Reverts = artifacts.require("Reverts");

contract("Reverts", (accounts) => {
    it("Check that param1=false, constructor reverts.", async () =>{
        await expectRevert.unspecified(Reverts.new(false));
    });
});
