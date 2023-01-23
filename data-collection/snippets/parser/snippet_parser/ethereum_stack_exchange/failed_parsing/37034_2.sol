extern crate rustc_hex;
extern crate tiny_keccak;

use rustc_hex::{FromHex, ToHex};
use tiny_keccak::Keccak;

fn main() {
    let hex = "00000000000000000000000000000000000000000000000000000000000000ea";
    let bytes = hex.from_hex().unwrap();

    let mut h = Keccak::new_keccak256();
    h.update(&bytes);
    let mut res: [u8; 32] = [0; 32];
    h.finalize(&mut res);

    println!("{}", res.to_hex());
}
