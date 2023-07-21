    ```function registerCompanies(address _companyaddress, string memory _companyname, string memory _companyboxaddress, string memory _companyscope, uint256 _companydateestablished, uint256 _yearsactive) public returns (address, string memory, string memory, string memory, uint256, uint256) {
require(_yearsactive >= 5, "You are not within the year range");
require(companies[_companyaddress] != true, "You are already registered");

newcompany = Company(_companyaddress, _companyname, _companyboxaddress, _companyscope, _companydateestablished, _yearsactive);
companystore[_companyaddress].companyaddress = _companyaddress;
companystore[_companyaddress].companyname = _companyname;
companystore[_companyaddress].companyboxaddress = _companyboxaddress;
companystore[_companyaddress].companyscope = _companyscope;
companystore[_companyaddress].companydateestablished = _companydateestablished;
companystore[_companyaddress].yearsactive = _yearsactive;

emit registerCompaniesEvent(_companyaddress, _companyname, _companyboxaddress, _companyscope, _companydateestablished, _yearsactive);
companyregistered.push(newcompany);

return (_companyaddress, _companyname, _companyboxaddress, _companyscope, _companydateestablished, _yearsactive);
