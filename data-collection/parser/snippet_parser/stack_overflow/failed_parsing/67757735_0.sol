...

function _createSucc(
        uint256 _parent1Id,
        uint256 _parent2Id,
        uint256 _genes,
        address _owner
    ) internal returns (uint256) {
        uint256 watersNeededIndex = 0;
        if (_parent1Id != 0) {
            watersNeededIndex = succs[_parent1Id].watersNeededIndex / 2;
        } else if (_parent2Id != 0) {
            watersNeededIndex = succs[_parent2Id].watersNeededIndex / 2;
        }
        succs.push(
            Succ(
                _genes,
                uint64(block.timestamp),
                0,
                0,
                uint8(watersNeededIndex),
                false
            )
        );
        uint256 _newSuccIndex = succs.length - 1;
        _safeMint(_owner, _newSuccIndex);
        emit newSucc(_owner, _newSuccIndex, _parent1Id, _parent2Id, _genes);
        return _newSuccIndex;
        
    }

    function buySucc(uint256 _genes, uint256 _price)
        external
        payable
        returns (uint256)
    {
        require(msg.value == _price, "Wrong price paid for succulent");
        return _createSucc(0, 0, _genes, msg.sender);
    }

...
