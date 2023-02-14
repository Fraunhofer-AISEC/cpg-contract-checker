task(
    "doSomething",
    "calls doSomething on most recent Foobar contract"
)
    .addParam("index", "your account name from the namedAccount config")
    .setAction(async ( namedAccount) => {
const MNEMONICS: string = process.env.MNEMONICS!;
const accounts: string[] = MNEMONICS.split(",");
const account =hre.ethers.Wallet.fromMnemonic(accounts[taskArgs.index]);
