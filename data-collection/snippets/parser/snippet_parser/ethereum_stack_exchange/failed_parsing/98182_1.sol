DeclarationError: Identifier already declared. --> Token.sol:23:5: | 23 | 
function transfer(address to, uint value) public returns(bool) { | ^ (Relevant source part starts here and spans across multiple lines). Note: The previous declaration is here: --> Token.sol:12:5: | 12 | event transfer(address indexed from, address indexed to, uint value); | 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
