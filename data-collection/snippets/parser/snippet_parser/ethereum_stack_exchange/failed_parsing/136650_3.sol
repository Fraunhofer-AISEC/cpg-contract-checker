        it("Should work easy", async () => {

const domain = {
    name: "name",
    version: "1.0.0",
    chainId,
    verifyingContract: contract.address,
}
const type = {
    ProofData: [
        { name: "user", type: "address" },
        { name: "otherUsers", type: "address" },
    ],
}

const data = {
    user: accounts[1].address,
    otherUsers: accounts[2].address
}

        const signature = await accounts[2]._signTypedData(
            domain,
            type,
            data
        )

        const result = await contract.verify(
            accounts[2].address,
            data,
            signature
        )

        expect(result).to.equal(true)
    })
