pragma solidity ^0.8;

contract MyContract {
    struct Briefing {
        string description;
        uint max_influencer;
        uint jobvalue;
        bool achievement;
    }
    
    Briefing summary;

    function getSummaryHardcoded() public view returns (Briefing memory) {
        return Briefing("desc", 1, 1, true);
    }

    function getSummaryStored() public view returns (Briefing memory) {
        return summary;
    }
}
