import { task } from "hardhat/config";

task("approve", "Approve")
  .addParam("spender", "spender address")
  .addParam("amount", "tokens amount")
  .setAction(async ({ spender, amount }, hre) => {
    // @ts-ignore
    const [signer] = await hre.ethers.getSigners();
    // @ts-ignore
    const instance = await hre.ethers.getContractAt(
      "ShitcoinToken",
      process.env.CONTRACT_ADDRESS as string,
      signer
    );
    await instance.approve(spender, amount);
  });
