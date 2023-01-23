contract("MyContractUnitTest", function(accounts) {
    let myContract;

    let owner    = accounts[0];
    let nonOwner = accounts[1];
    let wallet   = accounts[2];

    describe("test:", function() {
        before(async function() {
            myContract = await artifacts.require("MyContract.sol").new();
        });
        it("function addWallet should complete successfully if called by an owner", async function() {
            await myContract.addWallet(wallet, {from: owner});
        });
        it("function addWallet should abort with an error if called by a non-owner", async function() {
            await tryCatch(myContract.addWallet(wallet, {from: nonOwner}), errTypes.revert);
        });
    });

    async function tryCatch(promise, errType) {
        try {
            await promise;
            throw null;
        }
        catch (error) {
            assert(error, "Expected an error but did not get one");
            assert(error.message.startsWith(PREFIX + errType), "Expected an error starting with '" + PREFIX + errType + "' but got '" + error.message + "' instead");
        }
    }

    let errTypes = {
        revert            : "revert",
        outOfGas          : "out of gas",
        invalidJump       : "invalid JUMP",
        invalidOpcode     : "invalid opcode",
        stackOverflow     : "stack overflow",
        stackUnderflow    : "stack underflow",
        staticStateChange : "static state change"
    };

    let PREFIX = "VM Exception while processing transaction: ";
});
