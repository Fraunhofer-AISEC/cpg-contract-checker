pragma solidity >=0.7.0 <0.8.6;
[...]
    receive() external payable minumum_donation_amount(msg.value)  {
        OWNER.transfer(msg.value);
        donated_people[how_many_people_donated+1] = DonatedPeople(msg.sender, block.timestamp, msg.value);
        how_many_people_donated++;
        emit SubscribeDonatedPeople(msg.sender, block.timestamp, msg.value);
    }

    modifier minumum_donation_amount(uint256 amount) {
        require(amount >= 0.0005 ether, "The minumum donation amount is 0.0005 Ether");
        _;
    }
[...]
