---
title: Отладка
version: 2.1.0
---

<!--
This file is auto-generated from the 'welcome-to-xod' project.
Do not change this file manually because your changes may be lost after
the tutorial update.

To make changes, change the 'welcome-to-xod' contents or 'before-1st-h2.md'.

If you want to change a Fritzing scheme or comments for it, change the
'before-1st-h2.md' in the documentation directory for the patch.

Then run auto-generator tool (xod/tools/generate-tutorial-docs.js).
-->

<div class="ui segment note">
<span class="ui ribbon label">Примечание:</span>
Это Веб-версия учебника, встроенная прямо в XOD IDE. Чтобы обучение проходило лучше, мы рекомендуем установить
<a href="/downloads/">стационарную версию IDE для ПК</a> или запустить
<a href="/ide/">браузерную версию IDE</a>, и вы увидите там это же руководство.
</div>


# Отладка (настройка)

![Screenshot of 005-tweaks](./005-tweaks.patch.png)

Перезапускать программу каждый раз, когда вы меняете значение в Инспекторе, неудобно. С помощью `tweak-*` нод, вы можете вводить значения прямо во время работы программы.

В текущем патче мы добавили ноду `tweak-number` соединенную с пином `IVAL`.

## Упражнение

Давайте узнаем, как добавлять новые настройки в вашу программу и управлять ими во время выполнения.

1.  Разместите на патче ноду `tweak-number`.
2.  Соедините ноду `tweak-number` с пином `STEP` ноды `count`.
3.  Запустите симулятор.
4.  Дважды кликните на ноду `tweak-number`; текстовое поле для ввода значения будет отображено в Инспекторе.
5.  Смените значение на `2.0` и нажмите Enter.
6.  Регулируйте с помощью ввода значений в `tweak-number` скорость изменения значения ноды `clock`.

Обратите внимание на то, что изменения применяются немедленно, пока вы находитесь в режиме моделирования. Попробуйте другие значения и посмотрите, как они себя ведут.

## 👆 Совет

Используйте клавиши клавиатуры «Вверх» / «Вниз» в Инспекторе, чтобы изменить числовые значения на 0,1. Удерживайте Shift, чтобы отрегулировать на 1,0.

<div class="ui grid">
  <div class="five wide column left aligned ">
    <a href="../004-patching/">← Предыдущий урок</a>
  </div>
  <div class="six wide column center aligned ">
    <a href="../">Оглавление</a>
  </div>
  <div class="five wide column right aligned ">
    <a href="../006-help/">Следующий урок →</a>
  </div>
</div>
