
struct Data {
    address user;
    uint256 amount;
    address receiver;
}

function executeSomething(Data memory data) external returns(bool) {
    address user = data.user;
    _;
    return true;
}
