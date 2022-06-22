string public PROVENANCE;
function setProvenance(string memory provenance) public onlyOwner {
  PROVENANCE = provenanceHash;
}
