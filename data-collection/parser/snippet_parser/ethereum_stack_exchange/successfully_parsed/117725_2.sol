function ComplexFunction() internal returns (string memory) {
   return "Echo";
}

function Caller(string memory name) public returns (string memory) {
   return GasCost(name, ComplexFunction);
}

