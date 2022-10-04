     function Payout() public{

            require( voteEndTime< block.timestamp, "Voting Time is not up. Please come back later" );
            Voter storage sender = voters[msg.sender];

                if (negativeVotes > positiveVotes){
                    require(!sender.option, "Wrong Vote. Stake is distributed among winners");
                    payable(address(msg.sender)).transfer((stakes*sender.amount) / negativeStakes);
                    }

                else if (positiveVotes > negativeVotes){
                    require(sender.option, "Wrong Vote. Stake is distributed among winners");
                    payable(address(msg.sender)).transfer((stakes*sender.amount) / positiveStakes);
                }

                else{
                    payable(address(msg.sender)).transfer((stakes*sender.amount) / stakes);
                }
            }
