use std::io::{self, BufRead};

fn main() {
    let mut lines = io::stdin().lock().lines().map(|l| l.unwrap());
    let _n: i64 = lines.next().unwrap().trim().parse().unwrap();
    let nums: Vec<i64> = lines
        .next()
        .unwrap()
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let mut moves = 0;
    let mut prev_moves = 0;

    for pair in nums.windows(2) {
        prev_moves = (pair[0] + prev_moves) - pair[1];
        if prev_moves > 0 {
            moves += prev_moves;
        } else {
            prev_moves = 0;
        }
    }

    println!("{}", moves);
}
