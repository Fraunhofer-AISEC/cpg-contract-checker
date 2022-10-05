pragma solidity ^0.4.17;

contract hoteltranscation  {

    struct hotel{
        string HotelName;
        uint256 BookingNumber;
    }

    hotel[] HotelBookings;

    function HotelBooking(string _HotelName, uint256 _BookingNumber) public   {

        hotel memory tempHotel = hotel (_HotelName, _BookingNumber);
        
        HotelBookings.push(tempHotel);
    }

    function GetHotelBooking(uint _num) public view returns(string, uint256) {
        return (HotelBookings[_num].HotelName, HotelBookings[_num].BookingNumber);
    }
}
