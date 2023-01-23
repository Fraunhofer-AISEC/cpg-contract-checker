Compiling ./contracts/Ballot.sol...
Compiling ./contracts/Migrations.sol...

Compilation warnings encountered:

/home/bc/bheem/Ballot2/contracts/Ballot.sol:26:5: Warning: This declaration shadows an existing declaration.
    function Ballot() public {
    ^ (Relevant source part starts here and spans across multiple lines).
/home/bc/bheem/Ballot2/contracts/Ballot.sol:3:1: The shadowed declaration is here:
contract Ballot {
^ (Relevant source part starts here and spans across multiple lines).

,/home/bc/bheem/Ballot2/contracts/Migrations.sol:11:3: Warning: This declaration shadows an existing declaration.
  function Migrations() public {
  ^ (Relevant source part starts here and spans across multiple lines).
/home/bc/bheem/Ballot2/contracts/Migrations.sol:3:1: The shadowed declaration is here:
contract Migrations {
^ (Relevant source part starts here and spans across multiple lines).



/home/bc/bheem/Ballot2/contracts/Ballot.sol:26:5: SyntaxError: Functions are not allowed to have the same name as the contract. If you intend this to be a constructor, use "constructor(...) { ... }" to define it.
    function Ballot() public {
    ^ (Relevant source part starts here and spans across multiple lines).
,/home/bc/bheem/Ballot2/contracts/Migrations.sol:11:3: SyntaxError: Functions are not allowed to have the same name as the contract. If you intend this to be a constructor, use "constructor(...) { ... }" to define it.
  function Migrations() public {
  ^ (Relevant source part starts here and spans across multiple lines).
,/home/bc/bheem/Ballot2/contracts/Ballot.sol:26:5: Warning: This declaration shadows an existing declaration.
    function Ballot() public {
    ^ (Relevant source part starts here and spans across multiple lines).
/home/bc/bheem/Ballot2/contracts/Ballot.sol:3:1: The shadowed declaration is here:
contract Ballot {
^ (Relevant source part starts here and spans across multiple lines).

,/home/bc/bheem/Ballot2/contracts/Migrations.sol:11:3: Warning: This declaration shadows an existing declaration.
  function Migrations() public {
  ^ (Relevant source part starts here and spans across multiple lines).
/home/bc/bheem/Ballot2/contracts/Migrations.sol:3:1: The shadowed declaration is here:
contract Migrations {
^ (Relevant source part starts here and spans across multiple lines).

,/home/bc/bheem/Ballot2/contracts/Ballot.sol:57:46: TypeError: Data location must be "memory" for return parameter in function, but none was given.
    function getCount() public view returns (uint[8]) {
                                             ^-----^
Compilation failed. See above.
Truffle v5.0.2 (core: 5.0.2)
Node v8.12.0
 please help how to solve this ?
