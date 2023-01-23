abstract contract SmartContract {

  struct AxieGeneticsGenes {
    uint256 x;
    uint256 y;
  }

  event AxieEvolved(
    uint256 indexed _axieId,
    AxieGeneticsGenes _genes
  );
}
