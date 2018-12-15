# Работа со временем в C++

Многие ноды мгновенно реагируют на получаемые изменения, но некоторые из них управляют процессами, продолжающимися в течение длительного времени. После определнной задержки они пересматривают себя, чтобы повторить задачу или завершить свою работу.

[API ноды XOD C++](https://github.com/bgoncharov/xod-docs/blob/master/docs/reference/node-cpp-api) предоставляет функции планирования для решения этих задач. В этой статье мы изучим их на примере.

# Задача

Мы собираемся реализовать `tick` ноду, которая при срабатывании с помощью кнопки `SET` начинает посылать импульсы через равные промежутки времени `T`. Пользователь должен иметь возможность отменить выполняемую серию, отправив сигнал на вход `RST`.

Хотя вы могли бы тривиально выразить такой узел комбинацией `flip-flop` и `clock`, вообще не испольщуя C++, давайте пока обойдемся без это.

# Подготовка ноды

Как и обычно, когда вы [создаете ноду C++](https://github.com/bgoncharov/xod-docs/blob/master/docs/guide/nodes-for-xod-in-cpp), начните с нового патча, добавьте необходимые терминалы и `not-implemented-in-xod`.

![not-implemented-in-xod](https://github.com/bgoncharov/xod-docs/blob/master/docs/guide/cpp-time/outline.patch.png)

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