

pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/PaulRBerg/prb-math/blob/v1.0.3/contracts/PRBMathSD59x18.sol";
contract Reputationcalculation{
using PRBMathSD59x18 for int256;
    struct edgeserver{
        bool exists;
        uint placed_bids;
        uint reputation;
        uint deposit;
    }
    mapping (address => edgeserver) public edgeserver_suppliers;
      struct mobileuser{
      bool exists;
      uint deposit;
      
      bool auction_open;
    }
    mapping (address => mobileuser) public mobileusers;
    mapping(address => mapping(address =>mapping (uint=>uint))) public reputation;
    mapping(uint => edgeserver) public listedgeservers;
    mapping(address => mapping(address => uint)) public reputationid;
    
    



  

    address payable private owner; 
    address[] public mobile_user;
    address[] public edge_server;
    uint SIC;
    uint n; 
    uint u;
    uint s;
    address client;
    address server;
    uint reputationSum ;
    
    uint id=0;
    uint reputationlength;
    uint reputationAverage;
    modifier onlyOwner{
               require(msg.sender == owner,"Sender not authorized.");
      _;
    }
    
    modifier onlyClient{
      require(mobileusers[msg.sender].exists,"Sender not authorized.");
      _;
    }
    
    modifier onlySupplier{
      require(edgeserver_suppliers[msg.sender].exists,"Sender not authorized.");
      _;
    }
  


    event edgeserverRegistered(address supplierAddress);
    
    event mobileuserRegistered(address clientAddress);

    constructor () public{
        owner =payable( msg.sender);
        n=0;
        SIC=0;
        u=0;
        s=0;
        reputationSum = 0;
         
         reputationlength=0;
         reputationAverage=0;
        
    }
    function addmobileuser() payable public{
        require(!mobileusers[msg.sender].exists,"mobileuser already registered");


        require(!edgeserver_suppliers[msg.sender].exists,"Address registerd as a edgeserver");

        
        mobileusers[msg.sender]=(mobileuser(true,msg.value,false));
        client=msg.sender;

        u++;
        emit mobileuserRegistered(msg.sender);
    }
    function addedgeserver(address supplier) onlyOwner public{
        require(!mobileusers[supplier].exists,"Address registerd as a mobile user");

        edgeserver_suppliers[supplier]=(edgeserver(true,0,0,0));
        server=msg.sender;

        s++;
       
        emit edgeserverRegistered(supplier);
    }
    function SetReputation(address mobile, address edge, uint rating) public  {
    mobile_user.push(mobile);
    edge_server.push(edge);
    
    reputation[mobile][edge][id]= rating;
     id++;
    reputationlength=id;
    
    }
    
    function ComputeReputation(address user )public { 
      uint numRatings = 0;
      address mobile;
      address edge;
      for(id=0;id<=reputationlength;id++)
      {
        mobile=mobile_user[id];
        edge=edge_server[id];
        if(user==mobile){
          reputationSum += reputation[mobile][edge][id]; 
          numRatings++;
       }
      
      }

    }

    function getReputation( ) public returns(uint  ) 
    {
      reputationSum;
    }
      
}
