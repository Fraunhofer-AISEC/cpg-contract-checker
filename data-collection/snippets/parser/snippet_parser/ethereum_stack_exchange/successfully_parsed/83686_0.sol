pragma solidity 0.5.10;

contract Admin {
    address admin = msg.sender;

    function isAdmin() internal view returns (bool) {
        return msg.sender == admin;
    }
}


contract MultiAdmin is Admin {
    mapping(address => bool) extraAdmins;

    function addAdmin(address who) external {
        require(isAdmin());
        extraAdmins[who] = true;
    }
    function isAdmin() internal view returns (bool) {
        return extraAdmins[msg.sender] || super.isAdmin();
    }
}


contract TempAdmin is Admin {
    bool administratable = true;
    function disableAdmin() external {
        require(isAdmin());
        administratable = false;
    }
    function isAdmin() internal view returns (bool) {
        return administratable && super.isAdmin();
    }
}





contract Bank is TempAdmin, MultiAdmin {
    mapping(address => uint256) public balanceOf;

    function deposit() external payable {
        if (administratable) {
            require(isAdmin(), "Admins only during testing.");
        }
        balanceOf[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 amount = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
    function kill() external {
        require(isAdmin());
        selfdestruct(msg.sender);
    }
}
