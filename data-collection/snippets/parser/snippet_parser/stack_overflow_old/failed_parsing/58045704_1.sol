const { expectEvent, expectRevert } = require('@openzeppelin/test-helpers');

const TestContract = artifacts.require('Test03');

contract('Test03', function (accounts) {
    const [owner] = accounts;
    const txParams = { from: owner };

    beforeEach(async function () {
        this.testContract = await TestContract.new(txParams);
    });

    describe('construction', function () {
        it('initial state', async function () {
            expect(await this.testContract.owner()).to.equal(owner);

            
            await expectEvent.inConstruction(this.testContract, 'ContractCreated');
        });
    });

    describe('doSmth', function () {
      it('fail when passed zero id', async function () {

        
        await expectRevert(
          this.testContract.doSmth(0, txParams),
          "id is zero");
      });
  });    
});
