mapping(string => address) mcyclelicences;

function getMcycleByLic(string _license) public view returns(string, string, string, uint32) { 
  return (
    mcycleowners[mcyclelicenses[_license]].custname,
    mcycleowners[mcyclelicenses[_license]].color,
    mcycleowners[mcyclelicenses[_license]].make,
    mcycleowners[mcyclelicenses[_license]].year
  );      
}
