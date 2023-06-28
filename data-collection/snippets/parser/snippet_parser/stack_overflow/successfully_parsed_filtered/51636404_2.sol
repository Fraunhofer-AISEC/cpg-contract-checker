function pmt (
  int128 rate_per_period, int128 number_of_payments,
  int128 present_value, int128 future_value) public pure returns (int128) {
  if (rate_per_period != 0) {
    
    int128 q =
      ABDKMath64x64.pow (
        ABDKMath64x64.add (
          0x10000000000000000,
          rate_per_period),
        ABDKMath64x64.toUInt (
          number_of_payments));
    return
      ABDKMath64x64.div (
        ABDKMath64x64.mul (
          rate_per_period,
          ABDKMath64x64.add (
            future_value,
            ABDKMath64x64.mul (
              q,
              present_value))),
        ABDKMath64x64.mul (
          ABDKMath64x64.sub (
            q,
            0x10000000000000000),
          ABDKMath64x64.add (
            0x10000000000000000,
            rate_per_period)));
  } else if (number_of_payments != 0) {
    
    return
      ABDKMath64x64.div (
        ABDKMath64x64.neg (
          ABDKMath64x64.add (
            future_value,
            present_value)),
        number_of_payments);
  } else return 0;
}
