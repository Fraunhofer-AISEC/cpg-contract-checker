  contract WagyuRecordContract
    {
        address owner;

        struct Cattle
        {
            address RFID;
            string Name;
            uint256 Weight;
            string Gender;
            string Colour;
            string Breed;
            uint Age; 
            uint DOB;
            string Location;
            bool Parent;
            string SireName;
            string DamName;
            bool Active;
            bool ForSale;
            CattleHealth[] HealthRecord;
            CattleGrowth[] GrowthRecord;
            CattleMovements[] MovementsRecord;
            Facility SlaughterDetails;
            Meat[] DistributionDetails
        }


        struct CattleGrowth
        {
            uint DateRecorded;
            uint256 FoodIntake;
            uint256 Growth;
        }


        mapping (address => Cattle) public cattle;
        mapping (address=> CattleGrowth) public growth;           

        modifier Owner() 
        {
            require(msg.sender == owner);
            _;
        }


        function RecordHealth(address rfid, string _bodyCond, string _healthStat, uint256, string _med) Owner public
        {
            health[rfid+cattle[rfid].HealthRecord.length].DateRecorded = now;
            health[rfid+cattle[rfid].HealthRecord.length].BodyCondition = _bodyCond;
            health[rfid+cattle[rfid].HealthRecord.length].HealthStatus = _healthStat;
            health[rfid+cattle[rfid].HealthRecord.length].Medication = _med;
            cattle[rfid].HealthRecord.push(health[rfid+cattle[rfid].HealthRecord.length]);
        }
}
