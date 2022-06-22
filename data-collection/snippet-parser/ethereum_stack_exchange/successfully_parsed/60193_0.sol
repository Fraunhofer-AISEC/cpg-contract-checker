contract vendorContract {

    uint public vendorID;
    uint public ownerID;
    uint256 public contractValue;
    string public contractDescription;
    string public contractStatus;
    string public paymentStatus;
    address public contractOwner;
    address public contractVendor;
    string constant newcon = "New";
    string constant wipcon =  "WIP";
    string constant reqcon  = "Requested";
    string constant shipcon = "Shipped";
    string constant endcon = "Completed";
    string constant err = "Error";


    modifier isOwner()
    {
        if (msg.sender != contractOwner) throw;
        _ ;
    }

    modifier isVendor()
   {
        if (msg.sender != contractVendor) throw;
        _ ;
    }

    function vendorContract(uint _vid, string _desc) public {
        vendorID = _vid;
        contractStatus="New";
        contractOwner=msg.sender;
        contractDescription= _desc;

    }

      function acceptContract(uint256 _cvalue, uint _vidd) public {
        if (vendorID !=  _vidd) {
            contractStatus = err;
            throw;
        }

        contractStatus=wipcon;
        contractValue = _cvalue;
        contractVendor = msg.sender;
        }

    function requestPayment() isVendor {
    paymentStatus=reqcon;
    contractStatus=shipcon;
    }

    function paymentStatus() returns (string) {
    return paymentStatus;
    }


    function payVendor() payable isOwner {   
     if  (!contractVendor.send(contractValue))
        throw;
    
    contractStatus = endcon;


    }

   }
