uint256 public MAXUINT256 = 2*256 - 1;

for (uint256 i = 0; i < 255; i++) {
      var mask = MAXUINT256 * (2 ** i);
      var key = signature & bytes32(mask);

      if (Cell[key] != address(0)) {
        NEW_SIG = uint(sha256(signature,Cell[key]));
        Callback ctx = Callback(Cell[key]);
        ctx.ERNG_CALLBACK(NEW_SIG);

        if (i == bit) {
          Cell[key] = msg.sender;
        } else {
          Cell[key] = address(0);
        }
      } else {
        if (i == bit) {
          Cell[key] = msg.sender;
        }
      }
    }
