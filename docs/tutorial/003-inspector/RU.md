---
title: Ноды, пины, инспектор
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


# Ноды, пины, инспектор

![Screenshot of 003-inspector](./003-inspector.patch.png)

Теперь, когда мы увидели нашу программу в действии, давайте рассмотрим ее поближе и немного подправим.

Темно-серые прямоугольники на патче называются _нодами (nodes)_. Нода - это визуальное представление некоторого физического устройства или некоторой функции: от математики и логики до более сложных вещей, таких как создание, фильтрация или накопление значений, измерение времени и т.д.

Наша программа состоит из `clock`, `count`, и `watch` нод. `clock` отсчитывает определенный интервал, нода `count` увеличивает своё значение с каждым новым тиком, и нода `watch` отображает значение во время сеанса отладки или симуляции.

Маленькие цветные кружки на узлах называются _пины (pins)_. Они используются для передачи данных между узлами. Пины делятся на вход и выход. Входы всегда находятся на верхней стороне нод, а выходы - внизу.

Ноды обрабатывают значения с входных пинов и предпринимают какие-либо действия или выдают результат. Значения поступают на входные пины от выходов других нод через линки во время выполнения программы или определены постоянными значениями при указании их с помощью _Инспектора (Inspector)_ при создании программы.

## Упражнение

Давайте узнаем, как привязать значения к входным контактам с помощью панели Inspector.

1.  Щелкните `clock` ноду. Вы увидите панель Inspector в Project Browser..

2.  В Inspector измените значение `IVAL` с `1` на `0.1`.

Запустите симуляцию. Обратите внимание, что значение счетчика увеличивается намного быстрее. Попробуйте привязать другое значение к счетчику `STEP` и наблюдайте, как это влияет на поведение.

<div class="ui grid">
  <div class="five wide column left aligned ">
    <a href="../002-simulate/">← Previous lesson</a>
  </div>
  <div class="six wide column center aligned ">
    <a href="../">Index</a>
  </div>
  <div class="five wide column right aligned ">
    <a href="../004-patching/">Next lesson →</a>
  </div>
</div>
