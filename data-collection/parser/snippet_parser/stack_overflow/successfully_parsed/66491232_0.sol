    pragma solidity >=0.4.23 <0.6.0;

    function get_last24_hours_users()
    public
    view
    returns (
        uint256[] memory current_timestamp,
        address[] memory user_referrer_address,
        address[] memory user_address
    )
    {
    for (uint256 i = 0; i < users_count; i++) {
        User memory user = user[i];
        current_timestamp[i] = user.current_timestamp;
        user_referrer_address[i] = user.user_referrer_address;
        user_address[i] = user.user_address;
    }
    return (current_timestamp, user_referrer_address, user_address);
    }
