 const tx = await eduChain.applyUni(...args)
 const receipt = await tx.wait()
 const event = receipt.events.find(e => e.event === 'Applied_Uni')
