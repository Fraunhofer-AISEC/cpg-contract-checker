function register(
      bytes32[] memory _proofs,
      uint8 _bits,
      address _index,
      bytes32 _leaf
    ) internal pure returns (bytes32) {
        require(_index < SIZE, "_index bigger than tree size");
        require(_proofs.length <= DEPTH, "Invalid _proofs length");

        
        for (uint256 d = 0; d < DEPTH; d++) {
            if ((_index & 1) == 1) {
              if ((_bits & 1) == 1) {
                _leaf = hash(_proofs[d], _leaf);
              } else {
                _leaf = hash(0, _leaf);
              }
            } else {
              if ((_bits & 1) == 1) {
                _leaf = hash(_leaf, _proofs[d]);
              } else {
                _leaf = hash(_leaf, 0);
              }
            }

            _bits = _bits >> 1;
            _index = _index >> 1;
        }
        return _leaf;
    }
