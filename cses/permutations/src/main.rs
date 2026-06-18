use std::io::{self, BufRead};

fn main() {
    let mut lines = io::stdin().lock().lines().map(|l| l.unwrap());
    let n: i64 = lines.next().unwrap().trim().parse().unwrap();

    if n == 2 || n == 3 {
        println!("NO SOLUTION");
        return;
    }

    let mut permutation: Vec<i64> = (2..=n).step_by(2).collect();
    let second_part = (1..=n).step_by(2);
    permutation.extend(second_part);

    for i in permutation {
        print!("{} ", i);
    }
    println!();
}
