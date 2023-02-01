   let message : string = "check this message signed by account0";
   let messageHash = keccak256(utils.toUtf8Bytes(message));
   let signature = await address0.signMessage(messageHash);
   await hm.connect(address0).verifyMessage(message, signature);
