contract Patient is Clinic {
    uint256 public p_index = 0;

    struct Records {
        string cname;

        string l_cadence;
        string r_cadence;
        string n_cadence;

        string l_dsupport;
        string r_dsupport;
        string n_dsupport;

        string l_footoff;
        string r_footoff;
        string n_footoff;

        string l_steptime;
        string r_steptime;
        string n_steptime;


        string admittedOn;
        string dischargedOn;
        string ipfs;
    }

    struct patient {
        uint256 id;
        string name;
        string phone;
        string gender;
        string dob;
        string bloodgroup;
        string allergies;
        Records[] records;
        address addr;
    }

    address[] private patientList;
    mapping(address => mapping(address=>bool)) isAuth;
    mapping(address=>patient) patients;
    mapping(address=>bool) isPatient;

    function addRecord(address _addr, string memory cname, string memory l_cadence, string memory r_cadence, string memory n_cadence, string memory l_dsupport, string memory r_dsupport, string memory n_dsupport, string memory l_footoff, string memory r_footoff, string memory n_footoff, string memory l_steptime, string memory r_steptime, string memory n_steptime, string memory admittedOn, string memory dischargedOn, string memory ipfs) public {
        
    }
}
