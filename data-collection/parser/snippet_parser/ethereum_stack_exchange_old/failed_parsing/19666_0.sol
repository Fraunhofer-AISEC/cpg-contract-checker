uint initialSupply;
uint block0;
private function blocksSinceBlock0() returns (uint) {return block.number - block0;}
function totalSupply() returns (uint) { ... calculate current supply using blockSinceBlock0...}
