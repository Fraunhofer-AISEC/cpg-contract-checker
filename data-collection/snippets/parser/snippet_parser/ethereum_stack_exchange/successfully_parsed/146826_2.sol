bool public approvalsPaused = false;
mapping(address => mapping(address => bool)) private _operatorApprovals;

function _setApprovalForAll(address owner, address operator, bool approved) internal virtual override {
    require(owner != operator, "ERC721: approve to caller");
    require(approvalsPaused = false, "Approvals paused");
            if (isBlocked(msg.sender) == true) {
        revert("no transfer allowed");
    }
    _operatorApprovals[owner][operator] = approved;
    emit ApprovalForAll(owner, operator, approved);
}
