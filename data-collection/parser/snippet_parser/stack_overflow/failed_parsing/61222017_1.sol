    msg = tronWeb.sha3("this is test string");
    var signature = await tronWeb.trx.sign(msg);
    var r=signature.substr(0,66);
    var s= "0x" + signature.substr(66,64);
    var v="0x" + signature.substr(signature.length-2);
    retValue = await thisContractInstance.validate("this is test string",v,r,s).call();
