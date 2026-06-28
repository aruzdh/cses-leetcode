use std::io::{self, BufRead};

fn main() {
    let mut lines = io::stdin().lock().lines().map(|l| l.unwrap());
    let n: i64 = lines.next().unwrap().trim().parse().unwrap();

    let total_sum = n * (n + 1) / 2;

    if total_sum & 1 == 1 {
        println!("NO");
        return;
    }

    println!("YES");
    let candidate = total_sum / 2;
    let mut candidates1 = Vec::new();
    let mut candidates2 = Vec::new();
    let mut sum1 = 0;

    for i in (1..=n).rev() {
        if sum1 + i <= candidate {
            sum1 += i;
            candidates1.push(i);
        } else {
            candidates2.push(i);
        }
    }

    println!("{}", candidates1.len());
    for num in candidates1 {
        print!("{num} ");
    }
    println!();

    println!("{}", candidates2.len());
    for num in candidates2 {
        print!("{num} ");
    }
    println!();
}
