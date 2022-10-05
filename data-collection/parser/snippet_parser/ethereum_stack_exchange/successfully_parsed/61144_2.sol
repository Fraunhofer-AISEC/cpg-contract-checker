pragma solidity ^0.4.17;

contract hoteltranscation  {

    struct hotel{
        string HotelName;
        uint256 BookingNumber;
    }

    hotel[] HotelBookings;

    function HotelBooking(string _HotelName, uint256 _BookingNumber) public   {
        HotelBookings.push(hotel (_HotelName, _BookingNumber));
    }

    function GetHotelBooking(uint _num) public view returns(string, uint256) {
        return (HotelBookings[_num].HotelName, HotelBookings[_num].BookingNumber);
    }
}
