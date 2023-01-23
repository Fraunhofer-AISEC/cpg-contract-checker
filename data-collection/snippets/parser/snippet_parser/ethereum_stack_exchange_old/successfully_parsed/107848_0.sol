    function collectPayment(int _rating) public payable {
      payable(worker).transfer(address(this).balance);
    }
