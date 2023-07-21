interface ITokenAuth {
    function receiveAuthorization(bool _auth) external;
}

contract Example {
    function callMe(address _token, bool _auth) external {
       ITokenAuth(_token).receiveAuthorization(_auth);
    }
}
