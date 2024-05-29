const { execCmd } = require("./execCmd.cjs");

const isWindows = process.platform === "win32";

const args = process.argv.slice(2);

const cmd = `${isWindows ? "py" : "python3"} pre-commit-3.7.0.pyz install --hook-type pre-commit --hook-type pre-push --hook-type commit-msg`;

execCmd(cmd);
