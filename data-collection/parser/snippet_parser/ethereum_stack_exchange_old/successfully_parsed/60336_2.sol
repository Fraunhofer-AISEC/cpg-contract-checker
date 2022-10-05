function __callback(bytes32 _id, string _result, bytes _proof) public {
    require(msg.sender == oraclize_cbAddress());
    
    require(stringNotEmpty(QueryIdToQuery[_id]));

    bytes32 Input = QueryIdToQuery[_id];
    InputToResult[Input] = _result;
}
