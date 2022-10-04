function deleteProdotto(uint _id_prodotto) external payable onlyOwnerOf(_id_prodotto) {
  delete prodotti[0];    
}
