import { expect } from "chai";
import { ethers } from "hardhat";
import { TransactionRequest } from '@ethersproject/providers'

describe("Week1_HW_2", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.

  it('function deleteIndexMemory should return array without given index', async () => {
    const arrayDel = await ethers.getContractFactory("ArrayDelete");
    const deleteContract = await arrayDel.deploy();
    const exampleArray = [0n, 1n, 2n, 3n, 4n, 5n, 6n];
    const exampleIndex = 3;
    const expectedResult: bigint[] = [0n, 1n, 2n, 4n, 5n, 6n];
    expect(await deleteContract.deleteIndexMemory(exampleArray, exampleIndex))
      .to.deep.equal(expectedResult);    
    console.log('  == est gas=', await ethers.provider.estimateGas(
        {
          to: await deleteContract.getAddress(),
          data: deleteContract.interface.encodeFunctionData(
            "deleteIndexMemory",
            [exampleArray, exampleIndex]
          ),
        }
      ).then(e => e.toString())
    )
  })
});
