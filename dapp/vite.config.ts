import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { NodeGlobalsPolyfillPlugin } from "@esbuild-plugins/node-globals-polyfill";
import inject from "@rollup/plugin-inject";
import { viteCommonjs } from "@originjs/vite-plugin-commonjs";

export default defineConfig({
  plugins: [react(), viteCommonjs()],
  base: process.env.GH_PAGES ? "/nft-factory/" : "./",
  define: {
    global: "globalThis",
  },
  resolve: {
    alias: {
      "./mnemonic/wordlist": "/src/empty-module.js",
      "./wordlist": "/src/empty-module.js",
      buffer: "buffer",
    },
  },
  optimizeDeps: {
    include: ["@ton/core", "@ton/crypto", "@ton/ton"],
    esbuildOptions: {
      define: {
        global: "globalThis",
      },
      plugins: [
        NodeGlobalsPolyfillPlugin({
          buffer: true,
          process: true,
        }),
      ],
    },
  },
  build: {
    target: "esnext",
    rollupOptions: {
      plugins: [
        inject({
          Buffer: ["buffer", "Buffer"],
          global: "globalThis",
        }),
      ],
    },
    commonjsOptions: {
      transformMixedEsModules: true,
    },
  },
});
