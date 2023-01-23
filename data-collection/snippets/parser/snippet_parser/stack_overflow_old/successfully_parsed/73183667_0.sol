function compile_registro (string memory new_reg) public returns (bool registration){
  registro[ultima] = new_reg;
  ultima = ultima +1;
  registration = true;
  return registration;
}
        
function viewregistro(uint where) public view returns (string memory here){
  here = registro[where];
  return here;
}
