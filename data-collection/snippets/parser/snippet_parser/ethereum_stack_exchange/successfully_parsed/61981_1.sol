function isProdotto(bytes32 prodottoId) public view returns(bool isIndeed) {
  return prodottoStructs[prodottoId].isProdotto;
}
