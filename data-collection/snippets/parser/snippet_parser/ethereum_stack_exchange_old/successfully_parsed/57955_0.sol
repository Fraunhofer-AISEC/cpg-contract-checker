pragma solidity ^0.4.18;
import "./test/TestMigrationTarget.sol";

contract UpgraderToken is TestMigrationTarget {
 function UpgraderToken(address _oldToken)
    TestMigrationTarget(_oldToken) {
}
}
