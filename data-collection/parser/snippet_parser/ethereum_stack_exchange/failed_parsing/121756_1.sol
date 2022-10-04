describe("Amount Received",()=>{
  it("Should only mint When 1 Eth is received",async()=>{
    let v = await (contractInstance._mint({value:1}));
    v.wait();
     expect( v.value.toString()).to.equal("1");
  })
});
