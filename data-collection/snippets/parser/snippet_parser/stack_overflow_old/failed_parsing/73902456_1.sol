  import * as util from "ethereumjs-util";
  import { ethers } from "ethers";


  
  const message = req.body.message;
    
    const provider = new ethers.providers.JsonRpcProvider(
      "http://127.0.0.1:7545"
    );
    
    const contract = new ethers.Contract(
      contractAddress,
      abi,
      provider
    )
    
    
    
    let nonce: string | Buffer =
      "\x19Ethereum Signed Message:\n" +
      JSON.stringify(message).length +
      JSON.stringify(message);
    
    nonce = util.keccak(Buffer.from(nonce, "utf-8"));
    
    const { v, r, s } = util.fromRpcSig(req.body.signature);
    
    const pubKey = util.ecrecover(util.toBuffer(nonce), v, r, s);
    const addressBuffer = util.pubToAddress(pubKey);
    const address = util.bufferToHex(addressBuffer);
    if (address === req.body.address) {
      
    } else {
      reject("Validation Failed");
    }
