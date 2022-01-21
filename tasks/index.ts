import "./allowance";
import "./balance";
import "./approve";
import "./mint";
import "./transfer";
import "./transferFrom";

// 1 0xA8FFA026A9FBEb2654fE3c9454Ff7594A6333b9B
// 2 0x5A8Dc06711DC4E3b4F21A0Ab0abD54B363A3fcC7
// 3 0x19E342B11e3c7CFafEcee9c19bcC9D4F4332E7d8

// npx hardhat allowance --owner 0x5A8Dc06711DC4E3b4F21A0Ab0abD54B363A3fcC7  --spender 0xA8FFA026A9FBEb2654fE3c9454Ff7594A6333b9B --network kovan
// npx hardhat balance --address 0xA8FFA026A9FBEb2654fE3c9454Ff7594A6333b9B --network kovan
// npx hardhat approve  --spender 0xA8FFA026A9FBEb2654fE3c9454Ff7594A6333b9B --amount 200000000000000000000 --network kovan
// npx hardhat mint  --to 0x5A8Dc06711DC4E3b4F21A0Ab0abD54B363A3fcC7 --amount 5000000000000000000000 --network kovan
// npx hardhat transfer  --to 0x5A8Dc06711DC4E3b4F21A0Ab0abD54B363A3fcC7 --amount 100000000000000000000 --network kovan
// npx hardhat transferFrom --from 0x5A8Dc06711DC4E3b4F21A0Ab0abD54B363A3fcC7 --to 0x19E342B11e3c7CFafEcee9c19bcC9D4F4332E7d8 --amount 100000000000000000000 --network kovan
