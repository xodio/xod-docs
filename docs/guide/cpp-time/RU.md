# Работа со временем в C++

Многие ноды мгновенно реагируют на получаемые изменения, но некоторые из них управляют процессами, продолжающимися в течение длительного времени. После определнной задержки они пересматривают себя, чтобы повторить задачу или завершить свою работу.

[API ноды XOD C++](https://github.com/bgoncharov/xod-docs/blob/master/docs/reference/node-cpp-api) предоставляет функции планирования для решения этих задач. В этой статье мы изучим их на примере.

# Задача

Мы собираемся реализовать `tick` ноду, которая при срабатывании с помощью кнопки `SET` начинает посылать импульсы через равные промежутки времени `T`. Пользователь должен иметь возможность отменить выполняемую серию, отправив сигнал на вход `RST`.

Хотя вы могли бы тривиально выразить такой узел комбинацией `flip-flop` и `clock`, вообще не испольщуя C++, давайте пока обойдемся без это.

# Подготовка ноды

Как и обычно, когда вы [создаете ноду C++](https://github.com/bgoncharov/xod-docs/blob/master/docs/guide/nodes-for-xod-in-cpp), начните с нового патча, добавьте необходимые терминалы и `not-implemented-in-xod`.

![`not-implemented-in-xod`](https://github.com/bgoncharov/xod-docs/blob/master/docs/guide/cpp-time/outline.patch.png)

Не забудьте указать подходящее значение по умолчанию для `T`. 1 секунда - отлично.

Дважды щелкните `not-implemented-in-xod`, чтобы открыть редактор кода.

# Установка таймаута

Сначала мы должны обработать сигналы на входе SET. После этого мы бвоспуользуемся функцией setTimeout, чтобы запросить XOD снова вызвать `evaluate` после заданного нами времени ожидания:

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

Отлично. Мы сделали расписание. Теперь нужно сделать действие. Для этого используйте функцию [`isTimedOut`](https://github.com/bgoncharov/xod-docs/blob/master/docs/reference/node-cpp-api/#isTimedOut). Нам нужна явная проверка того, является ли текущая эвалюация вызванной таймаутом, поскольку причины для `evaluate` вызовов могут быть разные. Это можгут быть обновленные входные значения до истечения временного интервала.

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

Единственное, что нам осталось сделать - сбросить настройки. Когда сигнал посылается в `RST`, мы используем функцию [`clearTimeout`](https://github.com/bgoncharov/xod-docs/blob/master/docs/reference/node-cpp-api/#clearTimeout), чтобы остановить счет.

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

Вот и все. Наша нода готова. Проверьте это двумя кнопками, подключенными к `SET` и `RST` и триггером со светодиодом на другой стороне

![Test](https://github.com/bgoncharov/xod-docs/blob/master/docs/guide/cpp-time/test.patch.png)

# Заключение

XOD предоставляет довольно простой API для управления временем. Хоть это и просто, вы получаете все инструменты, необходимые для управления длительными процессами. Основные принципы:

* Используйте `setTimeout`, чтобы запланировать повторную эвалюацию. Помните, что таймауты задаются в миллисекундах.
* Всегда используйте `isTimedOut`, чтобы убедиться, что вы оцениваете, потому что прошло время.
* Если вы хотите периодически запускать задачу, то вызывайте `setTimeout` повторно вручную когда `isTimedOut`.
* Используйте `clearTimeout`, чтобы убедиться, что отсчет таймера запущен.
