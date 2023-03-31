it("fail test overflow desiredDecimals uint8 contract creating", async function() {
    let desiredDecimals = 2**8
    let token = await Token.new("Test token", desiredDecimals);
})
