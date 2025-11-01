#!/bin/bash

echo "🚀 Быстрый деплой Legal Docs"
echo "================================"
echo ""
echo "Выберите способ:"
echo "1) Surge (быстро, публичная ссылка)"
echo "2) Netlify (через CLI)"
echo "3) Vercel (через CLI)"
echo "4) Просто показать сборку локально"
echo "5) Создать ZIP архив"
echo ""
read -p "Ваш выбор (1-5): " choice

case $choice in
  1)
    echo ""
    echo "📦 Билдим проект..."
    npm run build
    echo ""
    echo "🚀 Деплоим на Surge..."
    echo "Если у вас нет аккаунта - создайте прямо в консоли!"
    cd dist
    npx surge
    ;;
  2)
    echo ""
    echo "📦 Билдим проект..."
    npm run build
    echo ""
    echo "🚀 Деплоим на Netlify..."
    npx netlify deploy --prod --dir=dist
    ;;
  3)
    echo ""
    echo "📦 Билдим проект..."
    npm run build
    echo ""
    echo "🚀 Деплоим на Vercel..."
    npx vercel --prod
    ;;
  4)
    echo ""
    echo "📦 Билдим проект..."
    npm run build
    echo ""
    echo "🌐 Запускаем локальный сервер..."
    echo "Откройте: http://localhost:4173"
    npm run preview
    ;;
  5)
    echo ""
    echo "📦 Билдим проект..."
    npm run build
    echo ""
    echo "📦 Создаем ZIP архив..."
    zip -r legal-docs-app.zip dist/ README.md БЫСТРЫЙ_ДЕПЛОЙ.md ДЕПЛОЙ.md
    echo ""
    echo "✅ Готово! Файл: legal-docs-app.zip"
    echo "Размер:"
    du -h legal-docs-app.zip
    ;;
  *)
    echo "Неверный выбор!"
    exit 1
    ;;
esac

echo ""
echo "✨ Готово!"


