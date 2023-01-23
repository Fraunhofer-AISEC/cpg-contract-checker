(contract Bank)

struct Holder   
    {
        uint unlockTime;
        uint balance;
    }

    mapping (address => Holder) public Acc;
