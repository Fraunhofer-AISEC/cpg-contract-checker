
pragma solidity >=0.4.22 <0.9.0;
contract Funder{
    mapping(address=>bool) contributors; 
    mapping(address=>uint) contributes;
    
    uint public cont;
    address public manager;
    uint public extra; 
    
    struct Request{
        uint id;
        string img_hash;
        string file_hash;
        string category;
        string description;
        address payable recipient;
        uint deadline;
        uint target;
        uint raisedAmount;
        bool completed;
        uint noOfDonors;
        bool approved;
        
        
    }
    mapping(address=>uint[]) whocreaterequest;
    mapping(uint=>Request) public requests;
    uint public numRequests;
    constructor(){
        manager=msg.sender;
    }
    receive() external payable{}

    
        function getContractBalance() public view returns(uint) 
        {
            return address(this).balance;
        }

    function createRequests(string memory cate,string memory _description,string memory imghash,string memory filehash,address payable _recipient,uint _time,uint _target) public {
        Request storage newRequest=requests[numRequests];
        newRequest.id=numRequests;
        newRequest.category=cate;
        newRequest.img_hash=imghash;
        newRequest.file_hash=filehash;
        newRequest.description=_description;
        newRequest.recipient=_recipient;
        newRequest.deadline=block.timestamp+_time; 
        newRequest.target=_target;
        newRequest.raisedAmount=0;
        newRequest.completed=false;
        newRequest.approved=false;
        newRequest.noOfDonors=0; 
        whocreaterequest[msg.sender].push(numRequests);
        numRequests++;
        
    }

    function seemyrequests() public view returns(Request[] memory)
    {
        Request[] memory yrequest = new Request[]((whocreaterequest[msg.sender]).length);
        
         for (uint i = 0; i < whocreaterequest[msg.sender].length; i++) 
         {
             Request storage lBi = requests[(whocreaterequest[msg.sender])[i]];
             yrequest[i]=lBi;
         }
        return yrequest;
    }


    
  
    

}
