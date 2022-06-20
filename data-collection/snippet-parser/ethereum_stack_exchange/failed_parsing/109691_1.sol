it('sets values and returns a template', async function() {
    temp =  await bManager.makeTemplate("EditionLimit", "The limit is ${limit}", "Limit: ${limit}", 2 )
    btaddress = await bManager.getTemplate("EditionLimit");
    bTemplate = btaddress.deployed(); 
    result = await bTemplate.bindingName();   
    expect(result).to.not.be.undefined;
})
