function payFees() public payable {
        require(students.has(msg.sender), "DOES NOT HAVE STUDENT ROLE");
        if(this.areFeesEnough(msg.value))
        {
            super.owner().transfer(msg.value);
            studentFees[msg.sender] = true;
        }

    }
