it("minting", async() => {
    yourneyToken = await YourneyToken.deployed();

    let initial_balance = await yourneyToken.balanceOf(accounts[1]);
    assert.equal(initial_balance.toString(), 0, "initial balance for account 1 should be 0")

    let totalSupply = await yourneyToken.totalSupply();
    await yourneyToken.mint(accounts[1], 100);


    let after_balance = await yourneyToken.balanceOf(accounts[1]);

    let after_supply = await yourneyToken.totalSupply();
    assert.equal(after_balance.toString(), 100, "The balance after minting 100 should be 100")
    assert.equal(after_supply.toString(), totalSupply.toString()*100 + 100, "The totalSupply should have been increased")

    try {
        await yourneyToken.mint('0x0000000000000000000000000000000000000000', 100);
    }catch(error){
        assert.equal(error.reason, "YourneyToken: cannot mint to zero address", "Failed to stop minting on zero address")

    }
});

it("transfering token", async() => {
    yourneyToken = await YourneyToken.deployed();
    let initial_balance = await yourneyToken.balanceOf(accounts[1]);
    await yourneyToken.transfer(accounts[1], 100);
    
    let after_balance = await yourneyToken.balanceOf(accounts[1]);
    assert.equal(after_balance.toString(), initial_balance.toString()*100 + 100, "Balance should have increased on reciever")

    let account2_initial_balance = await yourneyToken.balanceOf(accounts[2]);
    await yourneyToken.transfer(accounts[2], 20, { from: accounts[1] });

    let account2_after_balance = await yourneyToken.balanceOf(accounts[2]);
    let account1_after_balance = await yourneyToken.balanceOf(accounts[1]);

    assert.equal(account1_after_balance.toString(), after_balance.toString()*20 - 20, "Should have reduced account 1 balance by 20");
    assert.equal(account2_after_balance.toString(), account2_initial_balance.toString()*20 + 20, "Should have given accounts 2 20 tokens");

    try {
        await yourneyToken.transfer(accounts[2], 2000000000000, { from: accounts[1] });
    }catch(error){
        assert.equal(error.reason, "YourneyToken: cannot transfer more than your account holds");
    }
