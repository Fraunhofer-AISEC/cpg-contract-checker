import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";

contract newToken is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private _nftIds;
    address owner;

    
    event minted (string uri);
    constructor(string memory _uri,address _owner)ERC1155(_uri){
        owner=_owner;  
    }
    modifier onlyOwner{
        require(msg.sender==owner);
        _;
    }
    function mint(uint _amount,string memory  _uri)public  returns(uint){
       _nftIds.increment();
       uint currentId=_nftIds.current();
       _mint(owner,currentId,_amount,"");
       _setURI(_uri);
       emit minted(_uri);
       return currentId;
    }
    function transfer(address _to,uint _id, uint _amount)public returns(bool success){
        safeTransferFrom(
         owner,
         _to,
         _id,
         _amount,
        ""
    ) ;
    return true;

    }
    

}


contract createContract {
    newToken[] contractAddress;
    mapping(address=>newToken) public contracts;

    function create(string memory _uri) public {
        newToken addr=new newToken(_uri,msg.sender);
        contractAddress.push(addr);
        contracts[msg.sender]=addr;
    }
    function mint(string memory _uri)public  returns(newToken)  {
        if (address(contracts[msg.sender])==address(0)){
            create(_uri);
            contracts[msg.sender].mint(1,_uri);
            return contracts[msg.sender];

        }
        else{
            contracts[msg.sender].mint(1,_uri);
            return contracts[msg.sender];
        }
        
    }

}
