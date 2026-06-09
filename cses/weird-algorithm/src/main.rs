use std::io::{self, BufRead};

fn main() {
    let mut lines = io::stdin().lock().lines().map(|l| l.unwrap());
    let n: i64 = lines.next().unwrap().trim().parse().unwrap();

    let mut num = n;
    println!("{}", num);
    while num != 1 {
        if num & 1 == 0 {
            num /= 2;
        } else {
            num = num * 3 + 1;
        }
        println!("{}", num);
    }
}
