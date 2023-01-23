 pragma solidity ^0.4.17;

contract hotelbooking {

struct hotel {
  string HotelName;
  uint256 BookingNumber;
}

hotel[] HotelBookings;

function  HotelTranscation(string _HotelName,uint256 _BookingNumber) public {

  hotel memory temphotel = hotel(_HotelName,_BookingNumber);
  HotelBookings.push(temphotel);
}

    function GetHotelBooking(uint _num) public view returns(string, uint256) {
        return (HotelBookings[_num].HotelName, HotelBookings[_num].BookingNumber);

    }
}