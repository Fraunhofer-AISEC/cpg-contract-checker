import "hashes/pedersen/512bit" as hash;
import "hashes/utils/256bitsDirectionHelper" as multiplex;

const u32 DEPTH = 3;


def main(u32[8] root, private u32[8] leaf, private bool[DEPTH] directionSelector,     private u32[DEPTH][8] path) -> bool {

u32[8] mut digest = leaf;


for u32 i in 0..DEPTH {
    u32[16] preimage = multiplex(directionSelector[i], digest, path[i]);
    digest = hash(preimage);
}

return digest == root;
}
