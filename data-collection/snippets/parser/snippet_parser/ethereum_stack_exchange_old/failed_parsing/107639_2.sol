 it.only('can get a slice from a string', async () => {
      let string = "Now is the time";
      let result = await bStrings.getSlice(string, 5, 2);
      assert.equal("is", result);    
    })
