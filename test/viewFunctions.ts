import { expect } from "chai";

export default () => {
  it("The contract name must be equal to 'Shitcoin Token'", async function () {
    const name = await this.instance.getName();
    expect(name).to.equal("Shitcoin Token");
  });
  it("The contract symbol must be equal to 'SHT'", async function () {
    const symbol = await this.instance.getSymbol();
    expect(symbol).to.equal("SHT");
  });
  it("The contract decimals must be equal to '18'", async function () {
    const decimals = await this.instance.getDecimals();
    expect(decimals).to.equal("18");
  });
};
