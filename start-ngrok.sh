#!/bin/bash

echo "🚀 Legal Docs + ngrok"
echo "===================="
echo ""

# Проверяем ngrok
if ! command -v ngrok &> /dev/null; then
    echo "❌ ngrok не установлен!"
    echo ""
    echo "Установите ngrok:"
    echo "  Mac:     brew install ngrok"
    echo "  Linux:   wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
    echo "  Windows: choco install ngrok"
    echo ""
    echo "Или скачайте с https://ngrok.com/download"
    exit 1
fi

# Проверяем запущен ли dev сервер
if ! curl -s http://localhost:3000 > /dev/null 2>&1; then
    echo "⚠️  Dev сервер не запущен на порту 3000"
    echo ""
    echo "Запустите в другом терминале:"
    echo "  npm run dev"
    echo ""
    read -p "Нажмите Enter когда запустите dev сервер..."
fi

echo ""
echo "✅ Dev сервер работает на :3000"
echo ""
echo "🌐 Запускаю ngrok туннель..."
echo ""
echo "📋 Скопируйте URL который появится ниже"
echo "   и отправьте кому угодно!"
echo ""
echo "⏹️  Для остановки нажмите Ctrl+C"
echo ""
echo "===================="
echo ""

# Запускаем ngrok
ngrok http 3000


