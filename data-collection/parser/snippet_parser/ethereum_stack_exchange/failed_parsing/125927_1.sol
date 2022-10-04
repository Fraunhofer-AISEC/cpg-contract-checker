it("assure the version() function is not available in first contract", async function() {
        const addressOfFirstToken = await tokenFactory.getTokenAddress(0);
        const addressOfSecondToken = await tokenFactory.getTokenAddress(1);
        const firstToken = await Token.attach(addressOfFirstToken);
        const secondToken = await Token.attach(addressOfSecondToken);
        
        expect(await firstToken.version()).to.throw(TypeError);
}) 
