  it("ESCROW: Constructor test", async () => {

    const escrow = await TestEscrow.new(carrier, exporter, 10, { from: accounts[0] });

    assert.equal(
      await escrow.owner(),
      importer,
      "The importer is not the contract owner, which is accounts[0]."
    );
    assert.equal(await escrow.exporter(), exporter, "The exporter is not accounts[1].");
    assert.equal(await escrow.carrier(), carrier, "The carrier is not accounts[2].");
    assert.equal(
      await escrow.value(),
      10,
      "THe value of the ESCROW account is not 10."
    );
  });
