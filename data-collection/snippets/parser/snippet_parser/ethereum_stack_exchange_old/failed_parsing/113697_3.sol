var NzouaToken = artifacts.require('./NzouaToken');
var NzouaTokenSale = artifacts.require('./NzouaTokenSale');

contract('NzouaTokenSale', async (accounts) => {
    let tokenSale;
    let token;
    let tokenPrice = 1000000000000000; 
    const adminAccount = accounts[0];
    const buyerAccount = accounts[1];

    describe('Facilitates Token Buying', async () => {
        it('Required a successful Transfer of Tokens', async () => {
            token = await NzouaToken.deployed();
            tokenSale = await NzouaTokenSale.deployed();
            let tokenSaleBalance;
            let buyerBalance;

            const numberOfTokens = 10;


            const tokensAvailable = 750000;

            
            let receipt = await token.transfer.call(tokenSale.address, tokensAvailable, {
                from: adminAccount
            })

            tokenSaleBalance = await token.balanceOf(tokenSale.address);
            assert.equal(tokenSaleBalance.toNumber(), tokensAvailable, 'Contract received funds.')

            await tokenSale.buyTokens(numberOfTokens, {
                from: buyerAccount,
                value: numberOfTokens * tokenPrice
            });

            
            buyerBalance = await token.balanceOf(buyerAccount);
            buyerBalance = buyerBalance.toNumber()
            assert.equal(tokenSaleBalance, numberOfTokens, 'Buyer Balance updated');

            
            tokenSaleBalance = await token.balanceOf(tokenSale.address);
            tokenSaleBalance = tokenSaleBalance.toNumber()
            assert.equal(tokenSaleBalance, tokensAvailable - numberOfTokens, 'Token Sale Balance updated');

            
            
            
            

        });
    });

});
