contract Base {
    bool public active;

    modifier canSetMetadata() {
        require(active == false);
        _;
    }
}

contract BaseWithMetadataControl is Base {
    address public metadataControl;

    modifier canSetMetadata() {
        if(msg.sender != metadataControl) {
            super.canSetMetadata();
        }
        _;
    }
}
