extern crate multihash;
extern crate rustc_hex;

use multihash::{encode, Hash};
use rustc_hex::{FromHex, ToHex};

fn main() {
    let hex = "00000000000000000000000000000000000000000000000000000000000000ea";
    let bytes = hex.from_hex().unwrap();


    println!("{}", encode(Hash::Keccak256, &bytes).unwrap().to_hex());
}
