 event Broadcast(string x,string s1, string s2);

 function voteNow(string vote){
        Broadcast('voteLog','New vote','sender,vote');
        Broadcast('voteLog',toString(msg.sender),vote);

    }
 function toString(address x) returns (string) {
        bytes memory b = new bytes(20);
        for (uint i = 0; i < 20; i++)
            b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
        return string(b);
    }
