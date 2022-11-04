import "https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI_0.4.sol"

bytes scriptMultihash = "QmVJyXAmxdfuVgazi2PtnwXJdSiYPpkcvv6EydccQKkiZW";

Buffer.buffer memory cborArgs;
Buffer.init(cborArgs, 64);
cborArgs.startArray();
cborArgs.encodeUInt(9000);
cborArgs.endSequence();

oraclize_query("computation", [scriptMultihash, cborArgs.buf]);
