use std::io::{self, Read};

fn main() {
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).unwrap();
    let dna = input;

    if dna.len() < 2 {
        println!("{}", dna.len());
    }

    let mut max_len = 0;
    let mut candidate = 1;

    for window in dna.as_bytes().windows(2) {
        let prev = window[0];
        let curr = window[1];

        if prev == curr {
            candidate += 1
        } else {
            candidate = 1
        }
        max_len = max_len.max(candidate);
    }

    println!("{}", max_len);
}
