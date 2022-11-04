
const {BN, expectEvent, shouldFail, constants} = require("openzeppelin-test-helpers");
const Loan = artifacts.require("Loan");
const ERC20Mock = artifacts.require("ERC20Mock")

contract("Loan", function ([_, contractOwner, user]) {

    const initialSupply = new BN(1).mul(new BN(10).pow(new BN(28)))
    beforeEach(async function () {
        this.Loan = await Loan.new({from: contractOwner});
        this.Token = await ERC20Mock.new(user, initialSupply)
    });

    describe("#createLoan", function () {
        const collateralAmount = new BN(5).mul(new BN(10).pow(new BN(27)))
        const loanAmount = new BN(1).mul(new BN(10).pow(new BN(24)))
        const tokenPrice = new BN(1)
        beforeEach(async function () {
            await this.Loan.setTokenPrice(this.Token.address, tokenPrice, {from: contractOwner});
        });

        it("should revert if the user has an outstanding loan", async function () {
            await this.Token.approve(this.Loan.address, collateralAmount, {from: user}); 
            await this.Loan.createLoan(loanAmount, collateralAmount, this.Token.address, {from: user}) 
            shouldFail.reverting(this.Loan.createLoan(loanAmount, collateralAmount, this.Token.address, {from: user});
        });
    });
});
