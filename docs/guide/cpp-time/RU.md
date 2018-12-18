# Работа со временем в C++

Большинство нод моментально реагируют на получаемые изменения, но некоторые из них управляют процессами, продолжающимися в течение длительного времени. После определнной задержки они повторно выполняются, чтобы повторить задачу или завершить свою работу.

[API ноды XOD C++](/docs/reference/node-cpp-api) предоставляет функции планирования для решения таких задач. В этой статье мы рассмотрим их на примере.

# Задача

Мы собираемся реализовать ноду `tick`, которая при нажатии кнопки `SET` начинает посылать сигналы через равные промежутки времени `T`. Пользователь должен иметь возможность отменить выполняемую операцию, отправив сигнал на вход `RST`.

На самом деле вы могли бы просто организовать такую ноду скомбинировав `flip-flop` и `clock`, без использования C++, но сейчас мы это проигнорируем.

# Подготовка ноды

Как и обычно, когда вы [создаете ноду C++](/docs/guide/nodes-for-xod-in-cpp), начинайте с нового патча, добавьте необходимые ноды-терминалы и `not-implemented-in-xod`.

![`not-implemented-in-xod`](/xod-docs/blob/master/docs/guide/cpp-time/outline.patch.png)

Не забудьте указать нужное значение по умолчанию для `T`. 1 секунда - отлично.

Дважды щелкните `not-implemented-in-xod`, чтобы открыть редактор кода.

# Установка таймаута

Сначала мы должны обработать сигналы на входе `SET`. После этого мы воспуользуемся функцией [`setTimeout`](/docs/reference/node-cpp-api#setTimeout), чтобы попросить XOD снова вызвать `evaluate` после заданного нами времени ожидания:

```c++
struct State { };

\{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    if (isInputDirty<input_SET>(ctx)) {
        // Get T-input value. Conventionally it should be expressed in seconds
        Number t = getValue<input_T>(ctx);

        // However, XOD API works with millisecond values, so convert
        TimeMs milliseconds = t * 1000;

        // Schedule re-evaluation after calculated number of milliseconds
        setTimeout(ctx, milliseconds);
    }
}
```

# Управление таймаутами

Отлично. Мы "запланировали" сами себя. Теперь нужно среагировать. Для этого воспользуемся функцию [`isTimedOut`](/docs/reference/node-cpp-api/#isTimedOut). Нам нужна явная проверка того, вызвана ли текущая переоценка нашим таймаутом, поскольку причины для `evaluate` вызовов могут быть разные. Например, это могут быть обновленные входные значения, полученные до истечения временного интервала.

```c++
struct State { };

\{{ GENERATED_CODE }}

// Note, we extracted a function to read `T` input and set timeout
// with that value. The function helps us to avoid code duplication
// in `evaluate` since we need the code twice.
void charge(Context ctx) {
    Number t = getValue<input_T>(ctx);
    TimeMs milliseconds = t * 1000;
    setTimeout(ctx, milliseconds);
}

void evaluate(Context ctx) {
    if (isInputDirty<input_SET>(ctx)) {
        charge(ctx);
    }

    if (isTimedOut(ctx)) {
        // Timeout has been elapsed, emit an output pulse
        emitValue<output_OUT>(ctx, true);
        // To be re-evaluated next time we need to set timeout again
        charge(ctx);
    }
}
```

# Отмена таймаута

Последнее, что нам осталось сделать - сбросить настройки. Когда сигнал посылается в `RST`, мы используем функцию [`clearTimeout`](/docs/reference/node-cpp-api/#clearTimeout), чтобы остановить отсчет.

```c++
struct State { };

\{{ GENERATED_CODE }}

void charge(Context ctx) {
    Number t = getValue<input_T>(ctx);
    TimeMs milliseconds = t * 1000;
    setTimeout(ctx, milliseconds);
}

void evaluate(Context ctx) {
    if (isInputDirty<input_RST>(ctx)) {
        // When pulsed on `RST` we cancel the timeout countdown regardless
        // whether it was set or not
        clearTimeout(ctx);
        // Return from `evaluate` early giving priority to `RST` so that
        // pulse on `SET` and timeout will not be even checked at this
        // evaluation pass
        return;
    }

    if (isInputDirty<input_SET>(ctx)) {
        charge(ctx);
    }

    if (isTimedOut(ctx)) {
        emitValue<output_OUT>(ctx, true);
        charge(ctx);
    }
}
```

# Тест

Вот и все. Наша нода готова. Проверить это можно двумя кнопками, подключенными к `SET` и `RST` и триггером со светодиодом на другой стороне

![Test](/docs/guide/cpp-time/test.patch.png)

# Заключение

XOD предоставляет довольно простой API для управления временем. Хоть это и просто, вы получаете все инструменты, необходимые для управления длительными процессами. Основные принципы:

* Используйте `setTimeout`, чтобы запланировать повторную переназначения. Помните, что таймауты задаются в миллисекундах.
* Всегда используйте `isTimedOut`, потому что время уже прошло.
* Если вы хотите периодически запускать задачу, то вызывайте повторно `setTimeout` вручную, когда `isTimedOut`.
* Используйте `clearTimeout`, чтобы убедиться, что отсчет таймера запущен.
