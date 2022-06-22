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
