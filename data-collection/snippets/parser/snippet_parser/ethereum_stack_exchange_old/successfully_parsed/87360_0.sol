 
    function getData(uint256 id)
        public
        view
        returns (
            address,
            string memory,
            uint256[] memory,
            uint256[] memory,
            string memory,
            uint256 date,
            string memory
        )
    {
        return (
            data[id].owner,
            data[id].definition,
            data[id].support,
            data[id].likes,
            data[id].byteHash,
            data[id].date,
            data[id].text
        );
    }
