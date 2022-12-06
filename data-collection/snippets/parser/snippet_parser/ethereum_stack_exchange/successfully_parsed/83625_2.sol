function getVenueQueueElement(uint id, uint row) public view returns(address) {
  return venues[id].queue[row];
}
