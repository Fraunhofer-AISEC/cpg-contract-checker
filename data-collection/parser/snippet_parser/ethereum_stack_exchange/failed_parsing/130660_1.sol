TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/access/ownable/Ownable.sol:19:5:
   |
19 |     function owner() public view virtual returns (address) {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/access/IERC173.sol:16:5:
   |
16 |     function owner() external view returns (address);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/access/ownable/Ownable.sol:26:5:
   |
26 |     function transferOwnership(address account) public virtual onlyOwner {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/access/IERC173.sol:22:5:
   |
22 |     function transferOwnership(address account) external;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/access/ownable/SafeOwnable.sol:17:5:
   |
17 |     function nomineeOwner() public view virtual returns (address) {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/access/ownable/ISafeOwnable.sol:11:5:
   |
11 |     function nomineeOwner() external view returns (address);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/access/ownable/SafeOwnable.sol:24:5:
   |
24 |     function acceptOwnership() public virtual onlyNomineeOwner {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/access/ownable/ISafeOwnable.sol:16:5:
   |
16 |     function acceptOwnership() external;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Derived contract must override function "owner". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/access/ownable/SafeOwnable.sol:13:1:
   |
13 | abstract contract SafeOwnable is ISafeOwnable, Ownable, SafeOwnableInternal {
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IERC173": 
  --> @solidstate/contracts/access/IERC173.sol:16:5:
   |
16 |     function owner() external view returns (address);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Definition in "Ownable": 
  --> @solidstate/contracts/access/ownable/Ownable.sol:19:5:
   |
19 |     function owner() public view virtual returns (address) {
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "transferOwnership". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/access/ownable/SafeOwnable.sol:13:1:
   |
13 | abstract contract SafeOwnable is ISafeOwnable, Ownable, SafeOwnableInternal {
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IERC173": 
  --> @solidstate/contracts/access/IERC173.sol:22:5:
   |
22 |     function transferOwnership(address account) external;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Definition in "Ownable": 
  --> @solidstate/contracts/access/ownable/Ownable.sol:26:5:
   |
26 |     function transferOwnership(address account) public virtual onlyOwner {
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/introspection/ERC165.sol:17:5:
   |
17 |     function supportsInterface(bytes4 interfaceId) public view returns (bool) {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/introspection/IERC165.sol:15:5:
   |
15 |     function supportsInterface(bytes4 interfaceId) external view returns (bool);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/proxy/Proxy.sol:19:5:
   |
19 |     fallback() external payable virtual {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
 --> @solidstate/contracts/proxy/IProxy.sol:6:5:
  |
6 |     fallback() external payable;
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Derived contract must override function "". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/base/DiamondBase.sol:13:1:
   |
13 | abstract contract DiamondBase is IDiamondBase, Proxy {
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IProxy": 
 --> @solidstate/contracts/proxy/IProxy.sol:6:5:
  |
6 |     fallback() external payable;
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Definition in "Proxy": 
  --> @solidstate/contracts/proxy/Proxy.sol:19:5:
   |
19 |     fallback() external payable virtual {
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:16:5:
   |
16 |     function facets() external view returns (Facet[] memory diamondFacets) {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:19:5:
   |
19 |     function facets() external view returns (Facet[] memory diamondFacets);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:91:5:
   |
91 |     function facetFunctionSelectors(address facet)
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:26:5:
   |
26 |     function facetFunctionSelectors(address facet)
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Overriding function is missing "override" specifier.
   --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:136:5:
    |
136 |     function facetAddresses()
    |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:35:5:
   |
35 |     function facetAddresses()
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Overriding function is missing "override" specifier.
   --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:191:5:
    |
191 |     function facetAddress(bytes4 selector)
    |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:45:5:
   |
45 |     function facetAddress(bytes4 selector)
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/proxy/diamond/writable/DiamondWritable.sol:18:5:
   |
18 |     function diamondCut(
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/writable/IDiamondWritable.sol:30:5:
   |
30 |     function diamondCut(
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:85:5:
   |
85 |     receive() external payable {}
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/ISolidStateDiamond.sol:18:5:
   |
18 |     receive() external payable;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:90:5:
   |
90 |     function getFallbackAddress() external view returns (address) {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/ISolidStateDiamond.sol:24:5:
   |
24 |     function getFallbackAddress() external view returns (address);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Overriding function is missing "override" specifier.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:97:5:
   |
97 |     function setFallbackAddress(address fallbackAddress) external onlyOwner {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overridden function is here:
  --> @solidstate/contracts/proxy/diamond/ISolidStateDiamond.sol:30:5:
   |
30 |     function setFallbackAddress(address fallbackAddress) external;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Derived contract must override function "acceptOwnership". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "ISafeOwnable": 
  --> @solidstate/contracts/access/ownable/ISafeOwnable.sol:16:5:
   |
16 |     function acceptOwnership() external;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Definition in "SafeOwnable": 
  --> @solidstate/contracts/access/ownable/SafeOwnable.sol:24:5:
   |
24 |     function acceptOwnership() public virtual onlyNomineeOwner {
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "diamondCut". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "DiamondWritable": 
  --> @solidstate/contracts/proxy/diamond/writable/DiamondWritable.sol:18:5:
   |
18 |     function diamondCut(
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IDiamondWritable": 
  --> @solidstate/contracts/proxy/diamond/writable/IDiamondWritable.sol:30:5:
   |
30 |     function diamondCut(
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "facetAddress". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "DiamondReadable": 
   --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:191:5:
    |
191 |     function facetAddress(bytes4 selector)
    |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IDiamondReadable": 
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:45:5:
   |
45 |     function facetAddress(bytes4 selector)
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "facetAddresses". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "DiamondReadable": 
   --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:136:5:
    |
136 |     function facetAddresses()
    |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IDiamondReadable": 
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:35:5:
   |
35 |     function facetAddresses()
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "facetFunctionSelectors". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "DiamondReadable": 
  --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:91:5:
   |
91 |     function facetFunctionSelectors(address facet)
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IDiamondReadable": 
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:26:5:
   |
26 |     function facetFunctionSelectors(address facet)
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "facets". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "DiamondReadable": 
  --> @solidstate/contracts/proxy/diamond/readable/DiamondReadable.sol:16:5:
   |
16 |     function facets() external view returns (Facet[] memory diamondFacets) {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IDiamondReadable": 
  --> @solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol:19:5:
   |
19 |     function facets() external view returns (Facet[] memory diamondFacets);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Derived contract must override function "nomineeOwner". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "ISafeOwnable": 
  --> @solidstate/contracts/access/ownable/ISafeOwnable.sol:11:5:
   |
11 |     function nomineeOwner() external view returns (address);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Definition in "SafeOwnable": 
  --> @solidstate/contracts/access/ownable/SafeOwnable.sol:17:5:
   |
17 |     function nomineeOwner() public view virtual returns (address) {
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "supportsInterface". Two or more base classes define function with same name and parameter types.
  --> @solidstate/contracts/proxy/diamond/SolidStateDiamond.sol:17:1:
   |
17 | abstract contract SolidStateDiamond is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "ERC165": 
  --> @solidstate/contracts/introspection/ERC165.sol:17:5:
   |
17 |     function supportsInterface(bytes4 interfaceId) public view returns (bool) {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "IERC165": 
  --> @solidstate/contracts/introspection/IERC165.sol:15:5:
   |
15 |     function supportsInterface(bytes4 interfaceId) external view returns (bool);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Error HH600: Compilation failed
