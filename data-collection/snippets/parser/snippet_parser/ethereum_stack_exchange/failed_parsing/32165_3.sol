it('should never be zero', async () => {
    const instance = await ContractName.deployed()
    let err = null

    try {
      await instance.calculate.call(-1)
    } catch (error) {
      err = error
    }

    assert.ok(err instanceof Error)
})
