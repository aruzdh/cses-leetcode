use std::io::{self, BufRead};

fn main() {
    let mut lines = io::stdin().lock().lines().map(|l| l.unwrap());
    let n: i64 = lines.next().unwrap().trim().parse().unwrap();
    let nums: Vec<i64> = lines
        .next()
        .unwrap()
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let total_sum = n * (n + 1) / 2;
    let nums_sum: i64 = nums.iter().sum();

    println!("{}", total_sum - nums_sum);
}
