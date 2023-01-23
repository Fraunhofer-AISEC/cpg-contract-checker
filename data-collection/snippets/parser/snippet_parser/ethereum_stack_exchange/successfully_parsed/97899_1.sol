function patient_db(uint index) public view returns(string memory name, string memory blood) {
  patient storage p = patient_db[index];
  return(p.name, p.blood);
}
