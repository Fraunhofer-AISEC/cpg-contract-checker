contract("Social Music", async accounts => {
const [initialAddress] = accounts;

let instance;

beforeEach(async () => {
    instance = await SocialMusic.deployed();
});

it('should set userExists after setup', async () => {
    await instance.setup('testname', 25, 'Test descr');

    const result = await instance.hasAccount();

    expect(result).to.be.true;
});
});
