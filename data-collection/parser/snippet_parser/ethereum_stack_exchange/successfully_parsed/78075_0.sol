
function isValidDuration()
    public
    view
    returns (bool)
{
    uint32 calculatedDuration = uint32(end.sub(start));

     require(
        calculatedDuration >= 15 minutes,
        "The minimum session duration is 15 minutes."
    );

    require(
        calculatedDuration <= 1 weeks,
        "The maximum session duration is 1 week."
    );

    return true;
}
