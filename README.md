# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The Modulo Counter divides clocks by 2 * Count because a counter would take N or the Count input clock cycles to complete one count cycle. One full output period requires two toggles, one for the rising edge and the other for the falling edge. Therefore, each flip-flop in a counter divides the input clock frequency by 2 that creates a new clock signal with half the frequency.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The ring counter's output does not go to all 1's on the first cycle because its initial state is one high while the rest are low, which is then shifted by the first clock edge.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
The ring width would be equal to the division ratio N. For a one-hot ring counter, you would need 1000 flip-flops because the output frequency is the input clock frequency divided by the number of flip-flops. Ring counters circulate data in a loop, therefore each flip-flop ring counter outputs a pulse that is one cycle of the full ring.
