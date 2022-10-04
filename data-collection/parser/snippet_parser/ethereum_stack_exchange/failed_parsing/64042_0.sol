contract("MultiSigWallet", function(accounts) {
    let hMultiSigWallet;

    let utils = require("./utils");

    let NUM_OF_OWNERS    = 6;
    let NUM_OF_REQ_CONFS = 5;

    let owners   = accounts.slice(1, 1 + NUM_OF_OWNERS);
    let newOwner = accounts[1 + NUM_OF_OWNERS];

    beforeEach(async function() {
        hMultiSigWallet = await artifacts.require("MultiSigWallet").new(owners, NUM_OF_REQ_CONFS);
    });

    describe("functional assertion:", function() {
        it("function replaceOwner should abort with an error if called with a non-existing current owner", async function() {
            await execute(hMultiSigWallet.contract.replaceOwner, [newOwner, newOwner], "ExecutionFailure");
        });
        it("function replaceOwner should abort with an error if called with an already-existing new owner", async function() {
            await execute(hMultiSigWallet.contract.replaceOwner, [owners[0], owners[0]], "ExecutionFailure");
        });
        it("function replaceOwner should complete successfully if called with legal input arguments", async function() {
            await execute(hMultiSigWallet.contract.replaceOwner, [owners[0], newOwner], "Execution");
        });
    });

    async function execute(func, args, state) {
        let submitReceipt = await hMultiSigWallet.submitTransaction(hMultiSigWallet.address, 0, func.getData(...args), {from: owners[0]});
        let transactionId = utils.getParamFromTxEvent(submitReceipt, "transactionId", null, "Submission");
        for (let i = 1; i < NUM_OF_REQ_CONFS - 1; i++) {
            let confirmReceipt   = await hMultiSigWallet.confirmTransaction(transactionId, {from: owners[i]});
            let newTransactionId = utils.getParamFromTxEvent(confirmReceipt, "transactionId", null, "Confirmation");
            assert(newTransactionId.equals(transactionId), `expected = ${transactionId}, actual = ${newTransactionId}`);
        }
        let confirmReceipt   = await hMultiSigWallet.confirmTransaction(transactionId, {from: owners[NUM_OF_REQ_CONFS - 1]});
        let newTransactionId = utils.getParamFromTxEvent(confirmReceipt, "transactionId", null, state);
        assert(newTransactionId.equals(transactionId), `expected = ${transactionId}, actual = ${newTransactionId}`);
    }
});
