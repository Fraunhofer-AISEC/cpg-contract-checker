pragma solidity 0.4.24;

contract Base {
    bool public active;

    modifier canSetMetadata() {
        require(canSetMetadata_());
        _;
    }

    function canSetMetadata_() internal view returns (bool) {
        return (active == false);
    }
}

contract BaseWithMetadataControl is Base {
    address public metadataControl;

    function canSetMetadata_() internal view returns (bool) {
        if(msg.sender != metadataControl) {
            return super.canSetMetadata_();
        } else {
            return true;
        }
    }
}
