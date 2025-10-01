import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { viteCommonjs } from "@originjs/vite-plugin-commonjs";

export default defineConfig({
  plugins: [react(), viteCommonjs()],
  base: process.env.GH_PAGES ? "/nft-factory/" : "./",
  resolve: {
    alias: {
      "./mnemonic/wordlist": "/src/empty-module.js",
      "./wordlist": "/src/empty-module.js",
      buffer: "buffer/",
    },
  },
  define: {
    global: "globalThis",
  },
  optimizeDeps: {
    include: ["@ton/core", "@ton/crypto", "@ton/ton"],
  },
  build: {
    target: "esnext",
    commonjsOptions: {
      transformMixedEsModules: true,
    },
  },
});
