contract owned {
    address public owner;
    bool disabled;
    function owned() {
        owner = msg.sender;
        disabled = false;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
    }

    modifier disableable {
        if (disabled == true) throw;
    }
    function trasferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }

    event DisabledToggle(bool dis);

    function disable() onlyOwner {
        disabled = true;
        DisabledToggle(true);
    }

    function enable() onlyOwner {
        disabled = false;
        DisabledToggle(false);
    }


}

contract growId is owned {
    string public name;
    string public symbol;
    uint8 public decimals;
    mapping (address => uint256) public balanceOf;

    function growId() {
        name = "growId";
        symbol = "GID";
        decimals = 1;
    }

    function isOwner() returns (bool ret) {
        if (msg.sender == owner) return true;
    }

    function makeID(address target) onlyOwner {
        balanceOf[target] += 1;
        Transfer(0, target, 1);
    }

    function transfer(address _to) disableable {
        if (balanceOf[msg.sender] < 1 || balanceOf[_to] + 1 < balanceOf[_to])
        throw;

        if(msg.sender == owner){
            balanceOf[msg.sender] -= 1;
            balanceOf[_to] += 1;
            Transfer(msg.sender, _to, 1);
        }

        if(_to == owner){
            balanceOf[msg.sender] -= 1;
            balanceOf[_to] += 1;
            Transfer(msg.sender, _to, 1);
        }
        else throw;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract Auditor is owned {
    growId public grower_IDs;
    mapping (address => bool) public approvedGrows;

    function Auditor(address GID){
        grower_IDs = growId(GID);
        grower_IDs.transferOwenership(this);
    }

    function approveGrower(address target){
        if (approvedGrows[target] == true) throw;
        else approvedGrows[target] = true;
    }

    function issueGrowerID(address target) {
        if (approvedGrows[target] == true && grower_IDs.balanceOf.value(10).gas(1000)(target) == 0) {
            grower_IDs.makeID.value(10).gas(1000)(target);
        }
        else throw;
    }

}
