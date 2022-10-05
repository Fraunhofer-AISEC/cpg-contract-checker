contract CreateTournament {
    Tournament public newTournament;
    address[] newTournaments;
    uint index = 0;

    function createNewTournament(string _title, uint32 
_maxParticipants, uint _entryFee, uint _surcharge) public 
returns(address) {
        newTournament = new Tournament(_title, _maxParticipants, 
_entryFee, _surcharge);
        newTournaments.push(newTournament);
        return newTournament;
    }

    function checkAddress(address tournament) public view returns(bool) 
{
        bool exists = false;

        for (uint i = 0; i < newTournaments.length; i++) {
            if (tournament == newTournaments[i]) {
                exists = true;
            }
        }

        return exists;
    }
}
