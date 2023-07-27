# Solidity-Course
HW/TIL in Expert Solidity Bootcamp of Encode Club

---

## Week 1
1. [ArrayDelete.sol](./Week1/ArrayDelete.sol)

- Function deleteIndexMemory acts like `list.pop(index)` at Python, but instead of the deleted element it returns the array leftover after deletion of the element.
- It's a view function, and costs 27911 gas according to the gas simulation at ethers.js.