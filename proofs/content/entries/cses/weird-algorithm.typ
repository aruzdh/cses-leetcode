#import "../../../lib.typ": *

== Problem: Weird Algorithm

=== Statement, Goal, and Examples

*Statement*: _Consider an algorithm that takes as input a positive integer n. If n is even, the
algorithm divides it by two, and if n is odd, the algorithm multiplies it by three and adds one.
The algorithm repeats this, until n is one. For example, the sequence for n=3 is as follows:_

$ 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1 $
*Goal*: Simulate the execution of the algorithm for a given value of n.

*Input*: An integer $n$.

*Output*: A line that contains all values of $n$ during the algorithm.

*Constraints*: $1 <= n <= 10^6$

*Example*: Given $3$ as input, the output should be _3 10 5 16 8 4 2 1_

=== Strategy and Code

The problem statement essentially provides the algorithm directly. Furthermore, we do not need to
handle cases where the sequence cycles. The proposed code is the following:

```rust
 fn main() {
    input! {
        n: i64,
    }

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
```

=== Correctness

Before tackling the main result, let's consider the following loop invariant:


#lemma()[ Consider the provided algorithm. At the start of each iteration of the while loop, `num`
  holds the current value of the sequence, and all preceding values have been printed.
] <invariant_lema>

#proof()[
  - Initialization: Before the first iteration, `num = n` and it is printed. Thus, at the start of
    the first iteration, `num` holds the current value, and the preceding value (which is the only
    value so far) has been printed. The invariant holds.
  - Maintenance: During an iteration, if `num` is even or odd, it is updated exactly as the problem
    statement specifies. The updated value is then printed. Therefore, at the start of the next
    iteration, `num` holds the new current value, and all preceding values have been printed. The
    invariant holds.
  - Termination: If the initial input is `n = 1`, the loop condition is immediately false, and the
    sequence consisting solely of `1` has already been printed. Otherwise, the loop terminates when
    `num == 1`. On the iteration where `num` becomes 1, it is updated and printed before the loop
    condition is evaluated again. Thus, by the invariant, the correct sequence up to and including
    1 has been printed.
]

#theorem()[ For a given integer $n$, the preceding code prints out the correct sequence of numbers,
  according to the problem statement.
]

#proof()[
  Let $n$ be the input integer, and `num` the corresponding variable initialized to $n$. The first
  `println!("{}", num)` prints out the original value.

  The while loop executes as long as `num != 1`. We want to show that:

  1. The while statement terminates.

    The problem guarantees that the input $n <= 10^6$, and it is an
    #link("https://mathworld.wolfram.com/CollatzProblem.html")[empirically verified fact]
    that all such $n$ reach 1.

  2. Upon termination of the loop, we have printed out all the values of the sequence.

    This follows immediately from @invariant_lema.

  Since the code terminates and it prints out all values of $n$ during the algorithm, the
  implementation is correct.
]

=== Complexity

*Time Complexity*: The exact time complexity can vary significantly depending on the specific
number being processed, as no closed-form solution exists for the Collatz stopping time.

*Space Complexity*: The algorithm is iterative and only uses a constant number of variables. Thus,
the space complexity is $O(1)$.

=== Further Reading and References

This problem is based on the
#link("https://mathworld.wolfram.com/CollatzProblem.html")[Collatz conjecture], which has not been
proved for all natural numbers. Here, we are working with a specific subset that has been verified.

Want to give it a shot? Try it yourself #link("https://cses.fi/problemset/task/1068")[here] ☝️🤓.

#horizontalrule(dashed: true)

