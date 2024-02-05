module.exports = {
  presets: ["module:metro-react-native-babel-preset"],

  // [template] babel-plugin-transform-remove-console
  env: {
    production: {
      plugins: ["transform-remove-console"],
    },
  },

  // [template] babel-plugin-module-resolver
  plugins: [
    [
      "module-resolver",
      {
        root: ["./src"],
        alias: {
          "@": "./src",
        },
        extensions: [
          ".js",
          ".jsx",
          ".ts",
          ".tsx",
          ".android.js",
          ".android.tsx",
          ".ios.js",
          ".ios.tsx",
        ],
      },
    ],
  ],
};
