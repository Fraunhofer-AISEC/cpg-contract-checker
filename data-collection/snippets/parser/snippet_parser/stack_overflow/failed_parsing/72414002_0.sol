    modifier compPurch() {
        require(state == State.Locked, "it's not locked");
        _;
        time = block.timestamp;
    }

    modifier realBuyer() {
        require(msg.sender == buyer, "you're not the buyer");
        _;
    }

    modifier timeBought() {
        require(block.timestamp >= time + 5, "wait 5 mins fro purchase");
        _;
    }
}
