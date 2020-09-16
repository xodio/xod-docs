---
title: Манипулятор
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

# Manipulator

![Screenshot of 107-manipulator](./107-manipulator.patch.png)

Управлять сервоприводом с помощью потенциометра или другого аналогового датчика очень просто. Однако что, если мы хотим совершать более сложные движения сервоприводами?

Разместим на патче ноду `servo-device`. Эта нода определяет сервопривод для дальнейшего использования: пин управления, минимальную и максимальную ширину импульса, которые соответствуют рабочим пределам сервопривода.

Нода `servo-device` соединяется пинами с нодой, которая работает с сервоприводами, нодой `rotate-slow` для примера. Нода `rotate-slow` поворачивает серво на угол, указанный в `VAL` со скоростью `RATE` когда на `DO` приходит импульс. Можно соединять несколько таких нод последовательно для более сложных движений.

Обратите внимание, что нода `rotate-slow` имеет пин `MUX`. Этот пин `mutex` служит для последовательной работы нескольких нод над одним серво.

Данная программа при нажатии кнопки медленно поворачивает сервопривод до максимального угла, а затем поворачивает его обратно в два раза быстрее. Кнопка игнорируется до завершения вращения.

Загрузите программу в микроконтроллер и проверьте ее.

## Схема

<div class="ui segment note">
<span class="ui ribbon label">Примечание</span>
Схема такая же, как в предыдущем уроке
</div>

![Assembling LED to Uno](./circuit.fz.png)

[↓ Скачать проект в Fritzing project](./circuit.fzz)

## Упражнение

Давайте изменим траекторию движения сервопривода.

1.  Добавьте еще две ноды `rotate-slow`.
2.  Свяжите все ноды между собой.
3.  Отрегулируйте значения пинов `rotate-slow`.
4.  Загрузите программу в микроконтролле.

Нажмите кнопку и посмотрите, как сервопривод выполняет вашу комманду.

## 👆 Простые ноды и ноды устройств

В библиотеке `xod-dev/servo` также присутствует нода `rotate`. Основное её отличие от ноды `rotate-slow` в том, что она вращет серво, игнорируя пин `MUX`.

Также существует простая нода `servo`, использующая внутри себя ноды `servo-device` и `rotate` с выводами пинов. Простые ноды достаточны для базовой работы программ, но когда вам необходимо нечто большее, вам следует использовать ноды устройств совместно с нодами действий, как указано в этой главе.

Эта идиома применима и к любому оборудованию.

<div class="ui grid">
  <div class="five wide column left aligned ">
    <a href="../106-servo/">← Предыдущий урок</a>
  </div>
  <div class="six wide column center aligned ">
    <a href="../">Оглавление</a>
  </div>
  <div class="five wide column right aligned ">
    <a href="../108-text-lcd/">Следующий урок →</a>
  </div>
</div>
