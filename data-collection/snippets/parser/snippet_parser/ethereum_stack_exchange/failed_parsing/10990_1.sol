bytes memory prefix = "\x19Ethereum Signed Message:\n32";
hash = sha3(prefix, hash);
