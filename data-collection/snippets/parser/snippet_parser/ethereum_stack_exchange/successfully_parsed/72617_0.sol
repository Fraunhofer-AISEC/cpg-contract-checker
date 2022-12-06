contract BTCRelay {
function getLastBlockHeight() returns (int);
function getBlockchainHead() returns (int);
function getFeeAmount(int blockHash) returns (int);
function getBlockHeader(int blockHash) returns (bytes32[3]);
}
