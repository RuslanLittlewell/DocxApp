import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  server: {
    port: 3000,
    host: true, // Слушать на всех интерфейсах
    strictPort: false,
    hmr: {
      clientPort: 443 // Для ngrok
    },
    // Разрешить все хосты (для ngrok)
    allowedHosts: [
      '.ngrok-free.app',
      '.ngrok.io',
      '.ngrok.app',
      'localhost'
    ]
  }
})
