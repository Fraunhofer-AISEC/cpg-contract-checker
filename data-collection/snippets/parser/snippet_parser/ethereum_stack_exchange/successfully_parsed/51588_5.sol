function extractSig (bytes data) public pure returns(bytes32) {
      bytes32 out;
      for (uint i = 0; i < 32; i++) {
        out |= bytes32(data[12 + 32 + i] & 0xFF) >> (i * 8);
      }
      return out;
}
