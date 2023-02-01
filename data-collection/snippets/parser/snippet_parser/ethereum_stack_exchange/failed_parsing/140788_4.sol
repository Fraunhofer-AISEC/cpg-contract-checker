## mouseGame.test.ts

it("one random player must receive the mouse nft", async function () {
                    const promiseArray = new Array(5)
                        .fill(true)
                        .map((_, i) =>
                            mouseGame.connect(players[i]).inscribe({value: transactionFee})
                        );
                    await Promise.all(promiseArray);
                    await network.provider.send("evm_increaseTime", [inscriptionLimit]);
                    await network.provider.send("evm_mine");
                    const tx = await mouseGame.startGame();
                    await tx.wait();
                    expect(await mouseNft.ownerOf(1)).to.be.equal(players[4]);
                });
