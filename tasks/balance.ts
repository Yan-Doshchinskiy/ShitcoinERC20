import { task } from "hardhat/config";

task("balance", "Balance of account")
  .addParam("address", "account address")
  .setAction(async ({ address }, hre) => {
    // @ts-ignore
    const instance = await hre.ethers.getContractAt(
      "ShitcoinToken",
      process.env.CONTRACT_ADDRESS as string
    );
    const balance = await instance.balanceOf(address);
    console.log("balance", balance);
  });