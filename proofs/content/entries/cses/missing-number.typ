#import "../../../lib.typ": *

== Problem: Missing Number

=== Statement, Goal, and Example

*Statement*: You are given all numbers between $1, 2, dots.c, n$ except one.

*Goal*: Find the missing number.

*Input*: A first line that contains an integer $n$. A second line containing $n-1$ numbers. Each
number is distinct and between 1 and $n$ (inclusive).

*Output*: A line with the missing number.

*Constraints*: $2 <= n <= 2 dot.c 10^5$

*Example*: Given _5_ and _2 3 1 5_ as input, the output should be $4$.

=== Strategy and Code

Given an integer $n$ that denotes the length of our sequence, let `total_sum` be the sum of every
number $i$ between the range $1 <= i <= n$. Now, _what happens if we have a missing number $m$?_
We subtract $m$ from `total_sum` and obtain $s'$, the sum of all numbers $i$ between the range
$1 <= i <= n$, _*except*_ $m$. To find the value of $m$, the missing number, we just calculate
$"total_sum" - s'$.

#note[
  - Instead of looping from $1$ up to $n$ to obtain `total_sum`, we use the well-known
    #link("https://www.geeksforgeeks.org/maths/sum-of-natural-numbers/")[formula ] $(n (n +1))/2$.
  - Since we do not have $m$ at hand, we sum up every integer $i$ from the second line of the input.
    It is easy to see that both approaches are equivalent.
]

The proposed code is the following:

```rust
fn main() {
    input! {
        n: i64,
        nums: Vec<i64>
    }

    let total_sum = n * (n + 1) / 2;
    let nums_sum: i64 = nums.iter().sum();

    println!("{}", total_sum - nums_sum);
}
```

=== Correctness

Let's consider the next lemma:
#lemma()[
  For a given integer $n$, the sum of every integer $i$ in the range $1 <= i <= n$, that is
  $1 + 2 + dots.c + n$, equals $(n (n + 1))/2$.
]<sum_lemma>

#proof()[
  We proceed by induction on $n$.
  - First, suppose $n = 1$. We want to show that $1 = (1 (1 + 1))/2$, which holds immediately by
    simplifying the right side.
  - Second, assume the statement holds for $n' = n - 1$. We want to show that it holds for $n$;
    that is, $1 + 2 + dots.c + n = (n (n+1))/2$. Let's consider the left side of the equality,
    and apply the induction hypothesis to the sum of the first $n-1$ terms. We can derive the following:
  $
    1 + 2 + dots.c + (n-1) + n & = ((n-1)((n-1) + 1))/2 + n \
                               & = ((n-1)n)/2 + n \
                               & = ((n-1)n + 2n)/2 \
                               & = (n^2 - n + 2n)/2 \
                               & = (n^2 + n)/2 \
                               & = n(n+1)/2 \
  $
]

#theorem()[ For a given integer $n$ and a list of numbers $"nums"$, the preceding code prints out
  the correct missing number.
]

#proof()[
  Let's consider the following lines:
  - ```rust total_sum = n(n+1)/2```: The sum of all numbers, which is correct by @sum_lemma
    between $1$ and $n$
  - ```rust nums_sum = nums.iter().sum()```: The sum of every number in `nums` (assuming a correct
    implementation of ```rust sum()```.)

  We want to find an integer $m$ such that
  $"total_sum" = "nums_sum" + m$. Rearranging the equality, we derive
  $m = "total_sum" - "nums_sum"$, which is exactly what we compute inside
  ```rust println!("{}", total_sum - nums_sum);```.
]

=== Complexity

*Time Complexity*: Calculating ```rust total_sum``` takes $O(1)$ time; calculating ```rust nums_sum```
takes $O(n)$ time. The ```rust total_sum - nums_sum``` takes $O(1)$ time. Therefore, the time
complexity is $O(n)$.

*Space Complexity*: The algorithm uses a `Vec` to store the input numbers, which requires $O(n)$
memory.

#note()[
  If we want to achieve an $O(1)$-space-complexity implementation, we must replace the initial
  ```rust nums : Vec<i64>``` with the next code:
  ```rust
  for _ in 0..n-1 {
        let num: i64 = read_next_token();
        nums_sum += num;
    }
  ```
  assuming that ```rust read_next_token()``` has been correctly implemented. The proof and
  complexity analysis remain practically the same.
]

=== Further Reading and References

#link("https://brilliant.org/wiki/sum-of-n-n2-or-n3/")[This ] is another resource about the formula
we used. Moreover, it talks about the sum of $n^2$ and $n^3$.

Want to give it a shot? Try it yourself #link("https://cses.fi/problemset/task/1083/")[here] ☝️🤓.

#horizontalrule(dashed: true)

