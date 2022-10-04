abstract contract AxieGenetics {
  struct Genes {
    uint256 x;
    uint256 y;
  }
}

abstract contract SmartContract {
  event AxieEvolved(
    uint256 indexed _axieId,
    AxieGenetics.Genes _genes
  );
}
