// const { exec } = require("child_process");
const { execCmd } = require("./execCmd.cjs");

const isWindows = process.platform === "win32";

const args = process.argv.slice(2);

const cmd = isWindows ? ".\\gradlew.bat" : "./gradlew";

const cmds = {
  check: `${cmd} check`,
  spotless: `${cmd} spotlessApply`,
  rewrite: `${cmd} rewriteRun`,
  build: `${cmd} build`,
};

if (args.includes("--format")) {
  execCmd(cmds.spotless);
  execCmd(cmds.rewrite);
}
if (args.includes("--lint")) {
  execCmd(cmds.check);
}
if (args.includes("--build")) {
  execCmd(cmds.build);
}
if (args.length === 0) {
  execCmd(`${cmds.build}`);
}
