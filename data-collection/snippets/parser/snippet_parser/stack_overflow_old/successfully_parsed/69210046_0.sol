struct Briefing {
        string description;
        uint max_influencer;
        uint jobvalue;
        bool achievement;
        }

function getSummary() public view returns (Briefing) {
        return Briefing (
        string, 
        uint,
        uint, 
        bool
        ); 
}