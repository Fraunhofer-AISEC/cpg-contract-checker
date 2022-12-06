/home/user/webthree-umbrella/libethereum/libethash/internal.c:244:49: error: array subscript is above array bounds [-Werror=array-bounds]
   reduction = reduction * FNV_PRIME ^ mix->words[w + 1];
                                                 ^
/home/user/webthree-umbrella/libethereum/libethash/internal.c:245:49: error: array subscript is above array bounds [-Werror=array-bounds]
   reduction = reduction * FNV_PRIME ^ mix->words[w + 2];
                                                 ^
/home/user/webthree-umbrella/libethereum/libethash/internal.c:246:49: error: array subscript is above array bounds [-Werror=array-bounds]
   reduction = reduction * FNV_PRIME ^ mix->words[w + 3];
                                                 ^
cc1: all warnings being treated as errors
libethereum/libethash/CMakeFiles/ethash.dir/build.make:77: recipe for target 'libethereum/libethash/CMakeFiles/ethash.dir/internal.c.o' failed
make[2]: *** [libethereum/libethash/CMakeFiles/ethash.dir/internal.c.o] Error 1
CMakeFiles/Makefile2:810: recipe for target 'libethereum/libethash/CMakeFiles/ethash.dir/all' failed
make[1]: *** [libethereum/libethash/CMakeFiles/ethash.dir/all] Error 2
Makefile:117: recipe for target 'all' failed
make: *** [all] Error 2
