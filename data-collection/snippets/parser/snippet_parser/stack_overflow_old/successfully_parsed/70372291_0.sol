uint256 fee = ABDKMath64x64.mulu(
        ABDKMath64x64.divu(
          tokensProvided,
          others
        ),
        taxableValue
      );
