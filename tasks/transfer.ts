import { task } from "hardhat/config";

task("transfer", "Transfer tokens")
  .addParam("to", "recipient address")
  .addParam("amount", "tokens amount")
  .setAction(async ({ to, amount }, hre) => {
    // @ts-ignore
    const [signer] = await hre.ethers.getSigners();
    // @ts-ignore
    const instance = await hre.ethers.getContractAt(
      "ShitcoinToken",
      process.env.CONTRACT_ADDRESS as string,
      signer
    );
    await instance.transfer(to, amount);
  });
