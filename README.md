# Конфігурація Tiling WM

## Компоненти

1. **bspwm** -> налаштування вікон
2. **sxhkd** -> налаштування комбінацій клавіш
3. **polybar** -> полоска зверху яка відображає певну інформацію
4. **picom** -> керування тінню, прозорістю, ...
5. **alacritty** -> простий термінал який добре підходить до тайлінгу
6. **rofi** -> дозволяє швидко находити та відкривати файли на пристрої

## Встановлення

1. Встановлюємо пакети
```sh
sudo pacman -S bspwm sxhkd polybar picom alacritty rofi xorg-server xorg-server-common xorg-xinit xorg-xrandr
```

2. Встановлення шрифту (який підтримує іконки)
```sh
sudo pacman -S ttf-cascadia-mono-nerd
```

3. Клонуємо репозиторій
```sh
git clone https://github.com/Ilya-MAO/TilingWM-config.git $PATH/.tiling-config/
cd $PATH/.tiling-config/
```

4. Прописуємо команду для створення посилань у `~/.config`
```sh
./setup.sh
```

5. Створюємо файл `~/.xinitrc` та прописуємо там дві команди:
```sh
sxhkd &
exec bspwm
```

6. Запускаємо сесію у Tiling WM
```sh
startx
```
