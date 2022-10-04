pragma solidity ^0.4.4;

import "./ERC223_receiving_contract.sol";



contract TradeCenter is ERC223ReceivingContract{


    struct Rec{
        address from;
        uint tokens;
        bytes data;

    }

    mapping(address => uint) private _indexRec;
    mapping(uint => Rec) private _recs;
    uint private _index = 0;

    function tokenFallback(address _from, uint _value, bytes _data) public {

        _recs[_index] = Rec(_from,_value,_data);
        _indexRec[_from] = _index;
        _index++;


    }

    function getAddress() public view returns(address){

        Rec memory _rec = _recs[_indexRec[msg.sender]];

        return _rec.from;



    }




}
