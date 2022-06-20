contract WagyuRecordContract
{
    address farmer;

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
    }

    struct CattleHealth
    {
        uint DateRecorded;
        string BodyCondition;
        string HealthStatus;
        string Medication; 
    }

    struct CattleGrowth
    {
        uint DateRecorded;
        uint256 FoodIntake;
        uint256 Growth;
    }

    struct CattleMovements
    {
        string From;
        string To;
    }

    mapping (address => Cattle) public cattle;
    mapping (address=> CattleHealth) public health;
    mapping (address=> CattleGrowth) public growth;

    modifier Farmer() 
    {
        require(msg.sender == farmer);
        _;
    }

    function addNewCattle(address rfid, string _name, uint _weight, string _gender, string _colour,
    string _breed, uint _age, uint _dob) Farmer public
    {
        cattle[rfid].Name = _name;
        cattle[rfid].Weight = _weight;
        cattle[rfid].Gender = _gender;
        cattle[rfid].Colour = _colour;
        cattle[rfid].Breed = _breed;
        cattle[rfid].Age = _age;
        cattle[rfid].DOB = _dob;
    }

    function NewCattleDetails(address rfid, bool _parent, string _location, string _sireName, string _damName, bool _active, bool _forSale) public Farmer
    {
        cattle[rfid].Parent = _parent;
        cattle[rfid].Location =_location;
        cattle[rfid].SireName = _sireName;
        cattle[rfid].DamName =_damName;
        cattle[rfid].Active = _active;
        cattle[rfid].ForSale = _forSale;
    }

    function RecordHealth(address rfid, string _bodyCond, string _healthStat, uint256, string _med) Farmer public
    {
        health[rfid].DateRecorded = now;
        health[rfid].BodyCondition = _bodyCond;
        health[rfid].HealthStatus = _healthStat;
        health[rfid].Medication = _med;
        cattle[rfid].HealthRecord.push(health[rfid]);
    }

    function RecordGrowth(address rfid, uint256 _foodIntake, uint256 _growth) Farmer public
    {
        growth[rfid].DateRecorded = now;
        growth[rfid].FoodIntake = _foodIntake;
        growth[rfid].Growth = _growth;
        cattle[rfid].GrowthRecord.push(growth[rfid]);
    }
   }
