pragma solidity ^0.5.16;
contract ManagingOrder{
 address public owner;
 uint256 count;
 uint256 parkingCount;
 string order_list;
 uint256 order_number;
 string public result;

 
 struct Order {
        uint256 orderNumber;
        address buyer;
        address seller;
        uint256 parkingNumber;
        State state;
        string new_hour;
        uint256 cost;
        uint date;
    }

struct Parking {
        uint256 parkingNumber;
        address seller;
        string name;
        string phoneNumber;
        string postal_code;
        string avail_hour;
        string park_address;
    }


struct Buyer{
        string name;
        string phoneNumber;
}


    mapping(uint => Order) private ordersMap;
    mapping(uint => Parking) private parkingsMap;
    mapping(address => uint256) balancesMap;
    mapping(address => Buyer) private buyersMap;

 
 enum State { Created, Pending, Completed, Aborted }


 function ManageOrder() public{
 owner = msg.sender;
 count = 0;
 parkingCount=0;
 }

 
 modifier onlyBuyer(uint256 order_no) {
        require(msg.sender == ordersMap[order_no].buyer);
        _;
    }

 
 modifier onlySeller(uint256 order_no) {
        require(msg.sender == ordersMap[order_no].seller);
        _;
    }

 
 modifier inState(State _state, uint256 order_no) {
        require(ordersMap[order_no].state == _state);
        _;
    }

 
 modifier isMoney(uint _cost){
        require(balancesMap[msg.sender]>=_cost);
        _;
    }

 
 modifier isSeller(uint parkingNumber){
         
    require((parkingsMap[parkingNumber].postal_code)!=0);
    _;
 }


 function depositEther(uint _value) public returns (bool success){
     if(balancesMap[msg.sender]<0){
     return false;}

     balancesMap[msg.sender]+=_value;
     return true;
 }

 
   function newParking(string memory _name, string memory _phoneNumber, string memory _postal_code, string memory _park_address) public {
    bool parking_exists = false;
    uint parking_number;


    for(uint i=1; i<=parkingCount; i++){
        if (parkingsMap[parkingCount].seller == msg.sender){
            parking_exists = true;
            parking_number = parkingCount;
        }
    }

    if(!parking_exists){
        parkingCount++;
    Parking memory new_Parking = Parking({
            parkingNumber:parkingCount,
            seller:msg.sender,
            name:_name,
            phoneNumber: _phoneNumber,
            postal_code:_postal_code,
            avail_hour:"000000000000000000000000000000000000000000000000000000000000000000000000",
            park_address:_park_address
        });

    
    parkingsMap[parkingCount] = new_Parking;
    }else{

        parkingsMap[parking_number].name = _name;
        parkingsMap[parking_number].phoneNumber = _phoneNumber;
        parkingsMap[parking_number].postal_code = _postal_code;
        parkingsMap[parking_number].park_address= _park_address;
    }

 }

 
  function newBuyer(string memory _name, string memory _phoneNumber) public{
  

      if(bytes(buyersMap[msg.sender].name).length==0){
          Buyer memory new_Buyer = Buyer({
         name:_name,
         phoneNumber:_phoneNumber

         });
         buyersMap[msg.sender] = new_Buyer;
      }else{

         buyersMap[msg.sender].name = _name;
         buyersMap[msg.sender].phoneNumber=_phoneNumber;
      }
 }

 
 function newOrder(uint256 _parkingNumber, uint256 _cost, string memory _avail_hour, string memory _new_hour) public
 
        isMoney(_cost)
        isSeller(_parkingNumber)
    {

    count = count+1;

    Order memory new_Order = Order({
            orderNumber: count,
            parkingNumber: _parkingNumber,
            buyer: msg.sender,
            seller:parkingsMap[_parkingNumber].seller,
            state: State.Created,
            new_hour:_new_hour,
            cost:_cost,
            date:now
        });
    
    ordersMap[count] = new_Order;
    parkingsMap[_parkingNumber].avail_hour = _avail_hour; 
    balancesMap[ordersMap[count].buyer] -= _cost;
    ordersMap[count].state = State.Pending;
 }


 
 function checkParking(uint _parkingNumber) public returns (string memory _hour){

    result = concatFourStrings(concatThreeStrings(parkingsMap[_parkingNumber].name, parkingsMap[_parkingNumber].phoneNumber, parkingsMap[_parkingNumber].postal_code), parkingsMap[_parkingNumber].avail_hour, parkingsMap[_parkingNumber].park_address, "");
    return result;
 }

 
 function checkBuyer() public view returns (string memory)  {

    result = concatThreeStrings(buyersMap[msg.sender].name,buyersMap[msg.sender].phoneNumber,"");
    return result;
 }


 function numberParking() public view returns (string memory){
    for(uint i=1; i<=parkingCount; i++){
        if (parkingsMap[parkingCount].seller == msg.sender){
            result = concatFourStrings(concatThreeStrings(parkingsMap[parkingCount].name, parkingsMap[parkingCount].phoneNumber, parkingsMap[parkingCount].postal_code), parkingsMap[parkingCount].avail_hour, parkingsMap[parkingCount].park_address,uintToString(parkingCount));

        }
    }
    return result;
 }   

 
 function manageParking(uint256 _parkingNumber, string memory _avail_hour) public
 isSeller(_parkingNumber)
 {
    if(parkingsMap[_parkingNumber].seller == msg.sender)
    parkingsMap[_parkingNumber].avail_hour= _avail_hour;
 }

 
 function orderList() public returns (string memory)  {
    uint256 display_number = 0;
    string[4] memory sub_result ;
    for(uint256 i=0; i<count+1; i++){

      if (((ordersMap[i].buyer==msg.sender)||(ordersMap[i].seller==msg.sender))&&((ordersMap[i].state!=State.Completed)&&(ordersMap[i].state!=State.Aborted))&&(display_number<4)){
          string memory _a = uintToString(ordersMap[i].orderNumber);
          string memory _b = uintToString(ordersMap[i].parkingNumber);
          string memory _c = enumToString(ordersMap[i].state);
          string memory _d = uintToString(ordersMap[i].cost);
          string memory _e = uintToString(ordersMap[i].date);

          
          
          
          sub_result[display_number] = concatFourStrings(concatThreeStrings(_a,_b,_c),_d,_e,ordersMap[i].new_hour);
          display_number++;
      }
    }
    
    
    result = ordersMapConcat(sub_result[0],sub_result[1],sub_result[2],sub_result[3],"");
    return result; 
 }

 
 function concatThreeStrings(string memory _a, string memory _b, string memory _c) internal returns (string memory){
    bytes memory _bytes_a = bytes(_a);
    bytes memory _bytes_b = bytes(_b);
    bytes memory _bytes_c = bytes(_c);

    string memory abc = new string(_bytes_a.length + _bytes_b.length + _bytes_c.length + 3);
    bytes memory babc = bytes(abc);
    uint k = 0;
    for (uint i = 0; i < _bytes_a.length; i++) babc[k++] = _bytes_a[i];
    babc[k++] = "*";
    for (uint i = 0; i < _bytes_b.length; i++) babc[k++] = _bytes_b[i];
    babc[k++] = "*";
    for (uint i = 0; i < _bytes_c.length; i++) babc[k++] = _bytes_c[i];
    return string(babc);
}


function concatFourStrings(string memory _a, string memory _b, string memory _c, string memory _d) internal returns (string memory){
    bytes memory _bytes_a = bytes(_a);
    bytes memory _bytes_b = bytes(_b);
    bytes memory _bytes_c = bytes(_c);
    bytes memory _bytes_d = bytes(_d);

    string memory abcd = new string(_bytes_a.length + _bytes_b.length + _bytes_c.length + _bytes_d.length + 4);
    bytes memory babcd = bytes(abcd);
    uint k = 0;
    for (uint i = 0; i < _bytes_a.length; i++) babcd[k++] = _bytes_a[i];

    babcd[k++] = "*";
    for (uint i = 0; i < _bytes_b.length; i++) babcd[k++] = _bytes_b[i];
    babcd[k++] = "*";
    for (uint i = 0; i < _bytes_c.length; i++) babcd[k++] = _bytes_c[i];
    babcd[k++] = "*";
    for (uint i = 0; i < _bytes_d.length; i++) babcd[k++] = _bytes_d[i];

    babcd[k++] = "%";
    return string(babcd);
}


function ordersMapConcat(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e) internal returns (string memory){
    bytes memory _bytes_a = bytes(_a);
    bytes memory _bytes_b = bytes(_b);
    bytes memory _bytes_c = bytes(_c);
    bytes memory _bytes_d = bytes(_d);
    bytes memory _bytes_e = bytes(_e);
    
    string memory abcde = new string(_bytes_a.length + _bytes_b.length + _bytes_c.length + _bytes_d.length + _bytes_e.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;
    for (uint i = 0; i < _bytes_a.length; i++) babcde[k++] = _bytes_a[i];
    for (uint i = 0; i < _bytes_b.length; i++) babcde[k++] = _bytes_b[i];
    for (uint i = 0; i < _bytes_c.length; i++) babcde[k++] = _bytes_c[i];
    for (uint i = 0; i < _bytes_d.length; i++) babcde[k++] = _bytes_d[i];
    for (uint i = 0; i < _bytes_e.length; i++) babcde[k++] = _bytes_e[i];
    return string(babcde);
}

 

 function abortOrder(uint256 order_no) public
        inState(State.Pending,order_no)
    {

        address payable buyer = ordersMap[order_no].buyer;
        address payable seller = ordersMap[order_no].seller;

        if(msg.sender==ordersMap[order_no].buyer)
        {
        ordersMap[order_no].state = State.Aborted;
        
        buyer.transfer(ordersMap[order_no].cost*8/10);
        
        seller.transfer(ordersMap[order_no].cost*2/10);
        }
        else if(msg.sender==ordersMap[order_no].seller)
        {
        
        ordersMap[order_no].state = State.Aborted;

        
        buyer.transfer(ordersMap[order_no].cost*12/10);
        balancesMap[seller]-=ordersMap[order_no].cost*2/10;
        }

    }

 
 function confirmOrder(uint256 order_no) public
        onlyBuyer(order_no)
        inState(State.Pending,order_no)
    {
        
        ordersMap[order_no].state = State.Completed;
        address payable seller = ordersMap[order_no].seller;
        
        seller.transfer(ordersMap[order_no].cost);
        balancesMap[ordersMap[order_no].seller] += ordersMap[order_no].cost;
    }



 function () external payable {
     balancesMap[msg.sender]+=msg.value;
 }



 function uintto() public view returns (string memory){
     return result;
 }

 
function uintToString(uint v) public view returns (string memory str) {
        uint maxlength = 100;
        bytes memory reversed = new bytes(maxlength);
        uint i = 0;
        while (v != 0) {
            uint remainder = v % 10;
            v = v / 10;
            reversed[i++] = (48 + remainder);
        }
        bytes memory s = new bytes(i + 1);
        for (uint j = 0; j <= i; j++) {
            s[j] = reversed[i - j];
        }
        str = string(s);
    }


function enumToString(State _state) public view returns (string memory str){
    uint256 _temp;
    if(_state==State.Created){
        _temp = 1;
    }else if(_state==State.Pending){
        _temp = 2;
    }else if(_state==State.Completed){
        _temp = 3;
    }else {
        _temp = 4;
    }
    str = uintToString(_temp);
}


function addressToString(address x) public returns (string memory) {
    bytes memory b = new bytes(20);
    for (uint i = 0; i < 20; i++)
        b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
    return string(b);
}

}
