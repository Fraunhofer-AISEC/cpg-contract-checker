import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.7/KeeperCompatible.sol";

contract PolicyFactory {
    
    mapping(address => address[]) private deployedPoliciesByUser;
    address[] private deployedPolicies;
    address private admin = 0x3402c11c6f40e28b1D3996f11E5e54a937161fb9;

    event PolicyCreation(address policyAddress, string applicationId);

    modifier restricted(){
        require(msg.sender == admin, 'Not admin!');
        _;
    }

    function createPolicy(uint timePeriod, uint premium, address owner, uint startDate, string memory applicationId, uint endDate) public restricted returns (address){
       Policy newPolicy = new Policy(owner, premium, timePeriod, startDate, applicationId, endDate);
       deployedPoliciesByUser[owner].push(address(newPolicy));
       deployedPolicies.push(address(newPolicy));
       emit PolicyCreation(address(newPolicy), applicationId);    
    }

    function getDeployedPoliciesByUser(address user) public view returns (address[] memory)  {
        require(user != address(0));
        return deployedPoliciesByUser[user];
    }

    function getDeployedPolicies() public view restricted returns (address[] memory) { 
        return deployedPolicies;
    }
}

contract Policy is KeeperCompatibleInterface {
    address public owner;
    address public admin = 0x3402c11c6f40e28b1D3996f11E5e54a937161fb9;
    string public applicationId;
    uint public timePeriod;
    uint public premium;
    uint public startDate;
    uint public endDate;
    uint public nrPremiumsPayed;
    bool public active = true;

    event LogDeposit(address _from, uint amount, uint date);
    event LogWithdraw(address _to, uint amount, uint date);


    modifier restrictedAdminAndOwner(){
        require(address(msg.sender) == admin || address(msg.sender) == owner);
        _;
    }

    constructor(address _owner, uint _premium, uint _period, uint _startDate, string memory _applicationId, uint _endDate) public {
       owner = _owner;
       timePeriod = _period;
       premium = _premium;
       startDate = _startDate;
       endDate = _endDate;
       applicationId = _applicationId;
   }

   function checkUpkeep(bytes calldata ) external view override returns (bool upkeepNeeded, bytes memory ) {
        upkeepNeeded = (endDate - block.timestamp) <= 100000;
    }

    function performUpkeep(bytes calldata ) external override {
        if((endDate - block.timestamp) <= 100000) {
            active = false;
            (bool sent, ) = address(owner).call{value: address(this).balance}("");
            require(sent);
        }
    }

    
   function sendCompensation () public restrictedAdminAndOwner {
       require(owner != address(0) && active == false);
        (bool sent, ) = address(owner).call{value: address(this).balance}("");
        require(sent);
   }

   function getSummary () public view returns(address, address, uint, uint, uint, bool, uint, uint){
       return (
           owner, admin, timePeriod,premium,startDate,active,address(this).balance, endDate
       );
   }

    function withdraw (uint amount, bool closePolicy) public {
        require(msg.sender == owner && amount <= address(this).balance && active == true);
        (bool sent, ) = address(owner).call{value: amount}("");
        require(sent);
        if(closePolicy == true){
            active = false;
            sendCompensation();
        }
        emit LogWithdraw(address(owner), amount, block.timestamp);
    }

    function deposit () public payable {
        require(active == true);
        emit LogDeposit(address(msg.sender), msg.value, block.timestamp);
    } 
}

