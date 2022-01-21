import { task } from "hardhat/config";

task("allowance", "Allowance")
  .addParam("owner", "owner address")
  .addParam("spender", "spender address")
  .setAction(async ({ owner, spender }, hre) => {
    // @ts-ignore
    const instance = await hre.ethers.getContractAt(
      "ShitcoinToken",
      process.env.CONTRACT_ADDRESS as string
    );
    const allowance = await instance.allowance(owner, spender);
    console.log("allowance", allowance);
  });
