interface IValidator {
    function verifyHash(bytes32 hash) external view returns (address);
}

contract SP {
    IValidator validator;
    ...
    function verifyHash(bytes32 hash) external view returns (address) {
        return validator.verifyHash(hash);
    }
}
