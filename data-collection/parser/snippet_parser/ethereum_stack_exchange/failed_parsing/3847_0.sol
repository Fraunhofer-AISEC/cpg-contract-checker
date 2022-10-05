# We assume that data takes the following schema:
# bytes 0-31: v (ECDSA sig)
# bytes 32-63: r (ECDSA sig)
# bytes 64-95: s (ECDSA sig)
# bytes 96-127: sequence number (formerly called "nonce")
# bytes 128-159: gasprice
# bytes 172-191: to
# bytes 192-223: value
# bytes 224+: data

# Get the hash for transaction signing
~mstore(0, ~txexecgas())
~calldatacopy(32, 96, ~calldatasize() - 96)
~mstore(0, ~sha3(0, ~calldatasize() - 64))
~calldatacopy(32, 0, 96)
# Call ECRECOVER contract to get the sender
~call(5000, 1, 0, 0, 128, 0, 32)
# Check sender correctness; exception if not
if ~mload(0) != 0x82a978b3f5962a5b0957d9ee9eef472ee55b42f1:
    ~invalid()
# Sequence number operations
with minusone = ~sub(0, 1):
    with curseq = self.storage[minusone]:
        # Check sequence number correctness, exception if not
        if ~calldataload(96) != curseq:
            ~invalid()
        # Increment sequence number
        self.storage[minusone] = curseq + 1
# Make the sub-call and discard output
with x = ~msize():
    ~call(msg.gas - 50000, ~calldataload(160), ~calldataload(192), 160, ~calldatasize() - 224, x, 1000)
    # Pay for gas
    ~mstore(0, ~calldataload(128))
    ~mstore(32, (~txexecgas() - msg.gas + 50000))
    ~call(12000, ETHER, 0, 0, 64, 0, 0)
    ~return(x, ~msize() - x)
