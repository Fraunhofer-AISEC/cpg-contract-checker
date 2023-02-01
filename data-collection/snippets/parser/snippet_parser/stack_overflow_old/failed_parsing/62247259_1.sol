let contract = await tronWeb.contract().at(contract_address);
let msg = tronWeb.sha3('This is my message');
let signature = await tronWeb.trx.sign(msg);

var r = signature.substr(0, 66);
var s = "0x" + signature.substr(66, 64);
var v = "0x" + signature.substr(signature.length - 2);

let hexAddress = await contract.recoverAddr(msg, v, r, s).call();
