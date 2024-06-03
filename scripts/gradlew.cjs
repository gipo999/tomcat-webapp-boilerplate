// const { exec } = require("child_process");
const { execCmd } = require("./execCmd.cjs");

const isWindows = process.platform === "win32";

const args = process.argv.slice(2);

const cmd = isWindows ? ".\\gradlew.bat" : "./gradlew";

const cmds = {
  check: `${cmd} check`,
  spotless: `${cmd} spotlessApply`,
  rewrite: `${cmd} rewriteRun`,
  test: `${cmd} test`,
  build: `${cmd} buildWar`,
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
if (args.includes("--test")) {
  execCmd(cmds.test);
}
if (args.length === 0) {
  execCmd(`${cmds.build}`);
}
