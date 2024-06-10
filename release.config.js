const BREAKING_KEYWORDS = ["BREAKING CHANGE", "BREAKING CHANGES", "BREAKING"];
module.exports = {
  branches: [
    "main",
    "+([0-9])?(.{+([0-9]),x}).x", // e.g., 1.x, 1.2.x, 1.2.3.x
    // {
    //   name: "next",
    //   prerelease: true,
    // },
    {
      name: "dev",
      prerelease: true,
    },
    // {
    //   name: "alpha",
    //   prerelease: true,
    // },
    // {
    //   name: "beta",
    //   prerelease: true,
    // },
  ],
  plugins: [
    [
      "@semantic-release/commit-analyzer",
      {
        preset: "angular",
        parserOpts: {
          noteKeywords: BREAKING_KEYWORDS,
        },
      },
    ],
    [
      "@semantic-release/release-notes-generator",
      {
        preset: "angular",
        parserOpts: {
          noteKeywords: BREAKING_KEYWORDS,
        },
      },
    ],
    [
      "@semantic-release/github",
      {
        assets: [
          {
            path: "javadoc.zip",
            label: "javadoc folder added to release",
          },
          {
            path: "build/libs/*.war",
            label: "war app added to release",
          },
        ],
      },
    ],
  ],
};
