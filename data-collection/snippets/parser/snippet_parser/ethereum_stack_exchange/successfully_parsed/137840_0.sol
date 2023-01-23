struct Client{
        uint x;
    }

    mapping(uint => Client[]) client;

    function add(uint id, uint _x) public {
        client[id].push(Client(_x));
    }

    function get_all(uint id) public view returns(uint[] memory){

        uint[] memory lastItems;
        for(uint i=0;i<client[id].length;i++){

                lastItems[i] = client[id][client[id].length-i-1].x;
           
        }
        return lastItems;
    }
