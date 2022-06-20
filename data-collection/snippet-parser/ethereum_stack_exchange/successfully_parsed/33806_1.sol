import "./StringUtils.sol";
contract SaveData is Whitelist {
function verifyHash(address publicAddress, string hashstring) external returns (string) {
        require(StringUtils.equal(data[publicAddress],hashstring));

    }
}
