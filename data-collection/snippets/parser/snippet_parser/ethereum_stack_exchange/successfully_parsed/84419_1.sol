pragma solidity ^0.5.0;


contract HotelMenu{
    
                   struct Menu{
                                uint256 ID;
                                string Name;
                                uint256 Price;
                             }
                    uint256 ItemID;
                    mapping (uint256 => Menu) public Menuitems;
                    Menu[] public itemarray;
                    
                    struct Order{
                                   
                                   uint256 ItemID;
                                   uint256 Qty;
                                }
                    uint256 NextOrder;
                    mapping (uint256 => Order) public Orders;
                    Order[] public orderarray;
                    
                    event NewOrder (
                                        uint256 indexed ItemID,
                                        uint256 indexed OrderId
                                    );
                                       
                    function additemtomenu(string memory name, uint256 price) public
                                        {
                                        itemarray.push(Menu (ItemID, name, price));
                                        ItemID++;
                                        }
                    function PlaceOrder(uint256 _ItemID, uint256 Qty) public
                     {
                           
                           Orders[NextOrder] = Order(_ItemID, Qty);
                           
                           
                           emit NewOrder(_ItemID, NextOrder++);
                     }  
                     
                    function GetOrder(uint256 OrderId) public returns(uint256 , uint256)
                     {
                         for (uint256 i=0;i<=orderarray.length;i++)
                         {
                             if(orderarray[i].ItemID == OrderId)
                             {
                                return (orderarray[i].ItemID, orderarray[i].Qty); 
                             }
                         }
                         
                     }
                     
    
}
