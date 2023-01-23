> Compilation warnings encountered:

    Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https:
--> project:/contracts/sampleToken.sol

,Warning: Visibility for constructor is ignored. If you want the contract to be non-deployable, making it "abstract" is sufficient.
  --> project:/contracts/sampleToken.sol:11:1:
   |
11 | constructor() public 
   | ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Overriding public state variable is missing "override" specifier.
 --> project:/contracts/sampleToken.sol:7:1:
  |
7 | string public name = "ExampleToken";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden public state variable is here:
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:61:5:
   |
61 |     function name() public view virtual override returns (string memory) {
   |     ^ (Relevant source part starts here and spans across multiple lines).

,TypeError: Public state variables can only override functions with external visibility.
 --> project:/contracts/sampleToken.sol:7:1:
  |
7 | string public name = "ExampleToken";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden function is here:
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:61:5:
   |
61 |     function name() public view virtual override returns (string memory) {
   |     ^ (Relevant source part starts here and spans across multiple lines).

,TypeError: Overriding public state variable is missing "override" specifier.
 --> project:/contracts/sampleToken.sol:8:1:
  |
8 | string public symbol = "EGT";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden public state variable is here:
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:69:5:
   |
69 |     function symbol() public view virtual override returns (string memory) {
   |     ^ (Relevant source part starts here and spans across multiple lines).

,TypeError: Public state variables can only override functions with external visibility.
 --> project:/contracts/sampleToken.sol:8:1:
  |
8 | string public symbol = "EGT";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden function is here:
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:69:5:
   |
69 |     function symbol() public view virtual override returns (string memory) {
   |     ^ (Relevant source part starts here and spans across multiple lines).

,TypeError: Overriding public state variable is missing "override" specifier.
 --> project:/contracts/sampleToken.sol:9:1:
  |
9 | uint public decimals = 18;
  | ^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden public state variable is here:
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:86:5:
   |
86 |     function decimals() public view virtual override returns (uint8) {
   |     ^ (Relevant source part starts here and spans across multiple lines).

,TypeError: Public state variables can only override functions with external visibility.
 --> project:/contracts/sampleToken.sol:9:1:
  |
9 | uint public decimals = 18;
  | ^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden function is here:
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:86:5:
   |
86 |     function decimals() public view virtual override returns (uint8) {
   |     ^ (Relevant source part starts here and spans across multiple lines).

,TypeError: Overriding public state variable return types differ.
 --> project:/contracts/sampleToken.sol:9:1:
  |
9 | uint public decimals = 18;
  | ^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden public state variable is here:
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:86:5:
   |
86 |     function decimals() public view virtual override returns (uint8) {
   |     ^ (Relevant source part starts here and spans across multiple lines).

,TypeError: Contract "sampleToken" should be marked as abstract.
 --> project:/contracts/sampleToken.sol:5:1:
  |
5 | contract sampleToken is ERC20 
  | ^ (Relevant source part starts here and spans across multiple lines).
Note: Missing implementation: 
  --> @openzeppelin/contracts/token/ERC20/ERC20.sol:53:5:
   |
53 |     constructor(string memory name_, string memory symbol_) {
   |     ^ (Relevant
