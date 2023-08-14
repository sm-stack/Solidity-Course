## Week 3
1. [HW10.sol](./Week2/TestYul.sol)
- First div function spends 130 gas, when second one spends 37 gas, checked on Remix.
- This indicates Solidity is not quite gas efficient. `div1` function contains 8 `JUMP` opcodes, while `div2` doesn't require any.
