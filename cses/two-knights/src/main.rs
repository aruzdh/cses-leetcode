use std::io::{self, BufRead};

fn main() {
    let mut lines = io::stdin().lock().lines().map(|l| l.unwrap());
    let n: i64 = lines.next().unwrap().trim().parse().unwrap();

    for k in 1..=n {
        let total_squares = k * k;
        let total_placements = total_squares * (total_squares - 1) / 2;
        let attacking_pairs = 4 * (k - 1) * (k - 2);
        print!("{} ", total_placements - attacking_pairs);
    }
    println!();
}
