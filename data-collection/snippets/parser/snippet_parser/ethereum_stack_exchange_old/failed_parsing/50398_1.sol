myMac:solidity admin$ solc Test.sol
Test.sol:21:2: Error: Identifier already declared.
    function ownerInfo() public view returns (string) {
 ^ (Relevant source part starts here and spans across multiple lines).
Test.sol:9:2: The previous declaration is here:
    string ownerInfo = "Contract Owner name XYZ";
    ^------------------------------------------^
