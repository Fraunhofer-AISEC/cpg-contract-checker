const tx = fooFactory.deploy(testAddr);
const receipt = await tx.wait();
const event = receipt.events
        ?.filter(({ event }) => event == "OwnerAdded")
expect(event).to.not.be.null;
expect(event.args.owner).to.be.equals("0x83h342e46571f77h0531d");
