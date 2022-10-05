contract("Reverts", (accounts) => {
    it("Check that param1=false, constructor reverts.", async () =>{
        try{
            await Reverts.new(false);
        }
        catch{return;}
        assert.fail("Constructor does not revert when param1=false.");
    });
});
