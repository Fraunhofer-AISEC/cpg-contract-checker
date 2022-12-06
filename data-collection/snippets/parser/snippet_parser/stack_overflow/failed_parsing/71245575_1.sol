const MyContract = artifacts.require("../contracts/MyContract.sol");

contract("MyContract", accounts => {
    it("should deploy the contract and allow the user", async () => {
        const contract = await MyContract.deployed();

        const account = accounts[0];
        const owner = await contract.owner.call()

        await contract.allowUser(account).call({ from: owner });

        const allowedUser = contract.allowedUser.call(0);

        assert.equal(whitelistedUser, account, 'new user is not allowed');
    })
});
