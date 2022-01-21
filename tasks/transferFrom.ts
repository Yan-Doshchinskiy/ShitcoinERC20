import { task } from "hardhat/config";

task("transferFrom", "transferFrom tokens")
  .addParam("from", "owner address")
  .addParam("to", "recipient address")
  .addParam("amount", "tokens amount")
  .setAction(async ({ from, to, amount }, hre) => {
    const [signer] = await hre.ethers.getSigners();
    // @ts-ignore
    const instance = await hre.ethers.getContractAt(
      "ShitcoinToken",
      process.env.CONTRACT_ADDRESS as string,
      signer
    );
    await instance.transferFrom(from, to, amount);
  });
