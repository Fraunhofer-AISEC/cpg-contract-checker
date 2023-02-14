const Market = artifacts.require('../test/Market.sol')

contract('Market', function(accounts) {


let market;

beforeEach(`create subject instance before each test`, async function() {
    market = await Market.new();
})

it(`client put good on the market - one good - one good is available on the market`, async function() {
    let testGood = stringToUint("test good");

    await market.putGood(testGood, accounts[0], 1);

    let good = await market.getGood(testGood);

    assert.equals(good.owner, accounts[0]);
})
