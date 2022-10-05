const ethers = tronWeb.utils.ethersUtils;
let contract = await tronWeb.contract().at(contract_address);
let signingKey = new ethers.SigningKey(tronWeb.defaultPrivateKey);

let message = "This is some message";
let messageBytes = ethers.toUtf8Bytes(message);
let messageDigest = ethers.keccak256(messageBytes);

let signature = signingKey.signDigest(messageDigest);
let hexAddress = await contract.recoverAddr(messageDigest, signature.v, signature.r, signature.s).call();
