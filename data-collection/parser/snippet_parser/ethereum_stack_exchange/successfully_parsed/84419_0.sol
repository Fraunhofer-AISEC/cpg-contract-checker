pragma solidity ^0.5.0;

contract Menu{
    uint256 public BookingId;
    address public Guest;
    uint256 Qty;
    
    struct Menuitem{
        uint256  id;
        string name;
        uint256 Price;
    }
    struct table{
        uint256 tableid;
        uint256 numberofseats;
    }
      mapping (uint256 => Menuitem) public Order;
      mapping (uint256  =>mapping(uint256 => Menuitem)) public tableno;
      Menuitem[] itemarray;
      table[5] tablearray;
     
      
      function welcome() public {
          log0("welcome");   
      }
      
      function additem(uint256 _id, string memory _name, uint256 _price) public{
          
        Menuitem memory newitem = Menuitem(_id, _name, _price);
        Order[_id] = newitem;
        itemarray.push(newitem);
        Qty++;
      }
      function itemcount() public view returns(uint256){
          return Qty;
      }
      function deleteitem(uint256 _id) public{
          delete Order[_id];
          Qty--;
      }
     
      
      function getItem(uint256 _id) view public returns (string memory _name, uint256 _price) {   
         return(Order[_id].name, Order[_id].Price);
    }
}
