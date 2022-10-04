let num = -1234;
let bytes32 = "0x"+(new BN(String(num))).toTwos(256).toString('hex',64);
