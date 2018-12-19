---
title: Документация XOD
version: 1.0.1
---

<style>
/* Force linked headers to be black, not blue */
h2 a {
  color: black;
  text-decoration: underline;
}

h2.icon.header {
  padding: 1.5em 0 0.5em 0;
}

/* Style for tutorial/guide/reference icons */
.ui.icon.header img {
  width: 64px;
  opacity: 0.4;
}

#showcase-cards .card {
  width: 340px;
}

/* No space below a card image */
#showcase-cards .image {
  font-size: 0;
}

/* Keep all images the same size */
#showcase-cards .card img {
  width: 100%;
  height: 191px; /* Aspect ratio 16/9 for 340px width */
  object-fit: cover;
}
</style>

# Документация XOD

<div class="ui three column doubling stackable horizontally padded grid">

<!------------------------ Tutorial ------------------------->
<div class="column">
<h2 class="ui icon header">
  <a href="./tutorial/">
    <img src="./__img__/tutorial.svg" />
  </a>
  <div class="content">
    <a href="./tutorial/">Учебники</a>
  </div>
</h2>

<h3 class="ui header">Официальные</h3>

- [С чего начать](./tutorial/install/)
- [Полное содержание](./tutorial/) (28 разделов)

<h3>Для любителей видео учебников</h3>

<div class="ui relaxed list">
  {{#each tutvideos}}
    <div class="item">
      <img class="ui avatar image" src="{{ avatar }}">
      <div class="content">
        <a href="{{#url.ru}}{{url.ru}}{{/url.ru}}{{^url.ru}}{{url.en}}{{/url.ru}}" target="_blank">{{#title.ru}}{{title.ru}}{{/title.ru}}{{^title.ru}}{{title.en}}{{/title.ru}}</a>
        <!-- counter _blank underscore ↑ -->
        <div class="description">{{#description.ru}}{{description.ru}}{{/description.ru}}{{^description.ru}}{{description.en}}{{/description.ru}}</div>
      </div>
    </div>
  {{/each}}
</div>

</div><!-- column -->

<!-------------------------- Guide -------------------------->
<div class="column">
<h2 class="ui icon header">
  <a href="./guide/">
    <img src="./__img__/guide.svg" />
  </a>
  <div class="content">
    <a href="./guide/">Руководство пользователя</a>
  </div>
</h2>

[Концепции](./guide/#концепции) — объекты языка XOD и процессы, описанные в деталях.

[Создание собственных узлов](./guide/#создание-собственных-узлов) — самый простой способ расширить XOD и добавить поддержку нового оборудования.

[Примеры использования](./guide/#примеры-использования) — инструкции для общих сценариев.

[Проекты и библиотеки](./guide/#проекты-и-библиотеки) — как создать, управлять и делиться своими работами.

</div><!-- column -->

<!------------------------ Reference ------------------------>
<div class="column">
<h2 class="ui icon header">
  <a href="./reference">
    <img src="./__img__/reference.svg" />
  </a>
  <div class="content">
    <a href="./reference/">Справка</a>
  </div>
</h2>
<div><!-- A div to force the following list to be the first-child and suppress margins -->

- [Поддерживаемое оборудование](./reference/supported-hardware/)
  <i class="ui large green microchip icon"></i>
- [Управление мышью и горячие клавиши](./reference/shortcuts/)
- [Типы данных](./reference/data-types/)
- [API узлов на C++](./reference/node-cpp-api/)

</div>
<h3 class="ui header">Узлы стандартной библиотеки</h3>

- [`xod/bits`](https://xod.io/libs/xod/bits/)
- [`xod/common-hardware`](https://xod.io/libs/xod/common-hardware/)
- [`xod/core`](https://xod.io/libs/xod/core/)
  <i class="ui small yellow star outline icon"></i>
- [`xod/gpio`](https://xod.io/libs/xod/gpio/)
- [`xod/i2c`](https://xod.io/libs/xod/i2c/)
- [`xod/math`](https://xod.io/libs/xod/math/)
- [`xod/net`](https://xod.io/libs/xod/net/)
- [`xod/stream`](https://xod.io/libs/xod/stream/)
- [`xod/uart`](https://xod.io/libs/xod/uart/)
- [`xod/units`](https://xod.io/libs/xod/units/)

</div><!-- column -->

</div><!-- grid -->

---

<h2 id="showcase" class="ui header">
  <div class="content">
    Витрина
    <div class="sub header">Завершённые устройства, созданные с помощью XOD</div>
  </div>
</h2>

<div id="showcase-cards" class="ui cards">
  {{#each showcase}}
    <div class="card">
      <div class="image">
        <a href="{{ url }}" target="_blank"><img src="{{ image }}" /></a>
        <!-- counter _blank underscore ↑ -->
      </div>
      <div class="content">
        <a class="header" href="{{ url }}" target="_blank">{{#title.ru}}{{title.ru}}{{/title.ru}}{{^title.ru}}{{title.en}}{{/title.ru}}</a>
        <!-- counter _blank underscore ↑ -->
        <div class="meta">{{#description.ru}}{{description.ru}}{{/description.ru}}{{^description.ru}}{{description.en}}{{/description.ru}} от {{ author }}</div>
      </div>
    </div>
  {{/each}}
</div>

<h2 id="contributing" class="ui header"><a href="./contributing/">Помощь проекту</a></h2>

Ищешь способ улучшить документацию, язык или экосистему XOD? Есть много возможностей, и мы будем рады принять любую помощь. Прочтите как [внести свой вклад в XOD](./contributing/).
