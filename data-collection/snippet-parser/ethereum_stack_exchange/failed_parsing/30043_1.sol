========================
Welcome to Embark 2.6.0
========================
Building Assets
loading solc compiler..
compiling contracts...
token.sol:10:3: Warning: No visibility specified. Defaulting to "public".
  function Token( uint initial_balance ) {
  ^
Spanning multiple lines.

token.sol:14:3: Warning: No visibility specified. Defaulting to "public".
  function totalSupply() constant returns (uint supply) {
  ^
Spanning multiple lines.

token.sol:17:3: Warning: No visibility specified. Defaulting to "public".
  function balanceOf( address who ) constant returns (uint value) {
  ^
Spanning multiple lines.

token.sol:20:3: Warning: No visibility specified. Defaulting to "public".
  function transfer( address to, uint value) returns (bool ok) {
  ^
Spanning multiple lines.

token.sol:22:7: Warning: "throw" is deprecated in favour of "revert()", "require()" and "assert()".
      throw;
      ^---^

token.sol:25:7: Warning: "throw" is deprecated in favour of "revert()", "require()" and "assert()".
      throw;
      ^---^

token.sol:32:3: Warning: No visibility specified. Defaulting to "public".
  function transferFrom( address from, address to, uint value) returns (bool ok) {
  ^
Spanning multiple lines.

token.sol:35:7: Warning: "throw" is deprecated in favour of "revert()", "require()" and "assert()".
      throw;
      ^---^

token.sol:39:7: Warning: "throw" is deprecated in favour of "revert()", "require()" and "assert()".
      throw;
      ^---^

token.sol:42:7: Warning: "throw" is deprecated in favour of "revert()", "require()" and "assert()".
      throw;
      ^---^

token.sol:51:3: Warning: No visibility specified. Defaulting to "public".
  function approve(address spender, uint value) returns (bool ok) {
  ^
Spanning multiple lines.

token.sol:57:3: Warning: No visibility specified. Defaulting to "public".
  function allowance(address owner, address spender) constant returns (uint _allowance) {
  ^
Spanning multiple lines.

token.sol:60:3: Warning: Function state mutability can be restricted to pure
  function safeToAdd(uint a, uint b) internal returns (bool) {
  ^
Spanning multiple lines.

deploying contracts
Token already deployed at 0x4dbe9239321ddf4eae6eb32f83c1a50d3c426510
finished deploying contracts
writing file dist/css/app.css
writing file dist/js/app.js
writing file dist/index.html
Watching for changes
ready to watch file changes
