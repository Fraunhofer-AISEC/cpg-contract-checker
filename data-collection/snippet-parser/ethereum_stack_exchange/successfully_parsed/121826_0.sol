bool private isActive;

function hashSalt(bool _isActive) public returns (string memory) {
    isActive = _isActive;
    if (isActive) {
        return "SALT";
    }

    return "The state is not in active mode";
}
