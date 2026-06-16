#import "../../../lib.typ": *

== Problem: Repetitions

=== Statement, Goal, and Example

*Statement*: You are given a DNA sequence: a string consisting of characters _A_, _C_, _G_, and _T_.

*Goal*: Find the longest repetition in the sequence. This is a maximum-length substring containing
only one type of character.

*Input*: A line that contains a string of $n$ characters.

*Output*: A line with the length of the longest repetition.

*Constraints*: $1 <= n <= 10^6$

*Example*: Given _ATTCGGGA_ as input, the output should be $3$.

=== Strategy and Code

Let's `dna` denote the sequence of characters. We iterate over `dna` and keep track of two
values: `current_len`, which counts the length of the current contiguous block of identical
characters, and `max_len`, which stores the length of the longest block we have seen so far.

Since the constraints guarantee $n >= 1$, we know there is at least one character, so we can
initialize both `current_len` and `max_len` to $1$.

Since we are looking for contiguous repeated characters, there are two cases when comparing the
previous character (`prev`) to the current one (`curr`):
1. If `curr` is not equal to `prev`, the contiguous block is broken. We reset our counter by
  setting `current_len = 1`, counting `curr` as the first character of a new block.
2. If `prev` and `curr` are equal, the block continues. We increment our counter
  (`current_len += 1`).

In each iteration, we update `max_len` to be the maximum of `max_len` and `current_len`.
Once we have iterated over the whole `dna` string, `max_len` will hold the length of the longest
repetition.

The proposed code is the following:

```rust
fn main() {
    input! {
        dna: String
    }

    let mut max_len = 1;
    let mut current_len = 1;

    for window in dna.as_bytes().windows(2) {
        let prev = window[0];
        let curr = window[1];

        if prev == curr {
            current_len += 1;
        } else {
            current_len = 1;
        }
        max_len = max_len.max(current_len);
    }

    println!("{}", max_len);
}
```

=== Correctness

Prior to stating the main result, we establish the following loop invariant:

#lemma()[
  Consider the provided algorithm. At the start of each iteration of the for loop (processing a
  window containing `prev` and `curr`), `current_len` equals the length of the longest contiguous
  block of identical characters ending at `prev`, and `max_len` equals the length of the longest
  contiguous block seen in the entire string up to and including `prev`.
] <repetition_invariant>

#proof()[
  - Initialization: During the first iteration, the window points to indices 0 and 1. Thus, there
    are no characters before the window. The longest block ending at index 0 consists only of that
    character, so its length is 1. Similarly, the longest block seen in the string up to index 0 is
    also 1. Therefore, `current_len = 1` and `max_len = 1` hold.
  - Maintenance: During an iteration, we evaluate the relationship between `prev` and `curr`:
    - If `prev == curr`, the block ending at `prev` extends to `curr`. We increment `current_len`,
      so it now equals the length of the block ending at `curr`. `max_len` is updated to the
      maximum of its previous value and the new `current_len`, maintaining the invariant for the
      next iteration.
  - If `prev != curr`, the block ending at `prev` is broken. We reset `current_len = 1`,
    representing the new block starting (and ending) at `curr`. Again, `max_len` is updated
    correctly.
  - Termination: The loop terminates when we have processed all windows of size 2, meaning we have
    visited every character in the string. Since $n$ is finite, the loop eventually ends. By the
    invariant, `max_len` equals the length of the longest contiguous block seen in the entire
    string, which is exactly the required output.
]

We have the following theorem:
#theorem()[
  For any string of $n$ characters (according to the problem statement), the preceding code
  prints out the correct length of the longest repetition.
]

#proof()[
  We initialize `dna` to hold the input string, `max_len` to hold the minimum possible length for
  the solution of any instance of the problem, and `current_len` to work as an auxiliary variable.
  By @repetition_invariant, upon termination of the loop, `max_len` holds the correct integer
  representing the longest repetition. The algorithm then outputs this value.
]


=== Complexity

*Time Complexity*: We iterate over each character of `dna` once using a sliding window, resulting
in $O(n)$ time.
*Space Complexity*: We allocate a String of size $n$ to store the input. The auxiliary variables
use $O(1)$ space. Thus, the overall space complexity is $O(n)$.

#note()[
  If we wish to achieve an $O(1)$ space complexity, we can avoid storing the entire string in
  memory by reading the characters sequentially from the input stream:
  ```rust
    let curr : char = read_next_char();
  ```
  while keeping the relation between `prev` and `curr` discussed earlier, and assuming that
  ```rust read_next_char()``` has been correctly implemented. The proof and complexity analysis
  remain practically the same.
]

=== Further Reading and References

Want to give it a shot? Try it yourself #link("https://cses.fi/problemset/task/1069/")[here] ☝️🤓.

#horizontalrule(dashed: true)

