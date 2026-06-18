use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let mut lines = stdin.lock().lines();
    let t: usize = lines.next().unwrap().unwrap().trim().parse().unwrap();

    for _ in 0..t {
        let line = lines.next().unwrap().unwrap();
        let mut parts = line.split_whitespace();
        let x: i64 = parts.next().unwrap().parse().unwrap();
        let y: i64 = parts.next().unwrap().parse().unwrap();

        let size = x.max(y);
        let corner_num = size * size - size + 1;
        let mut ans = corner_num;

        if x != size {
            ans += if size & 1 == 0 { -(size - x) } else { size - x };
        } else {
            ans += if size & 1 == 0 { size - y } else { -(size - y) };
        }

        println!("{}", ans);
    }
}
