pragma solidity ^0.4.17;


contract hoteltranscation  {

  struct hotel{
    string HotelName;
    uint256 BookingNumber;
  }

   function HotelBooking(string _HotelName,uint256 _BookingNumber ) public   {
     hotel storage addtrascation =  hotel (_HotelName,_BookingNumber);
   }
}
