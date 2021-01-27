---
title: Tabtest Reference
version: 1.0.0
---

# Tabtest Reference

Each tabtest is represented as a table, where:

- the first row contains pin labels or the special [time flow](#time-flow-column) name
- all subsequent rows contain cells with some input and expected output values. See [literals](#literals) section for details.
- each row is one test case that executes within one [transaction](/docs/guide/execution-model/) of a XOD program
- if the tested node contains some state inside it [will be shared](/docs/guide/testing-patches/#state-keeping) between all test cases

## Literals

Generally, literals for tabtests are the same that are used in the Inspector. But also there are few special literals for tabtests only.

### Numbers

<table class="ui table compact">
  <thead>
    <tr>
      <th>Literal</th>
      <th>Meaning</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody class="top aligned">
    <tr>
      <td><code>23</code>, <code>-76</code></td>
      <td>Integers</td>
      <td></td>
    </tr>
    <tr>
      <td><code>0.035</code>, <code>-29.7054</code></td>
      <td>Floats</td>
      <td></td>
    </tr>
    <tr>
      <td><code>NaN</code></td>
      <td>NaN</td>
      <td>It's "valid" Number, that can be produced sometimes. For example, by diving zero by zero.</td>
    </tr>
    <tr>
      <td><code>Inf</code>, <code>-Inf</code></td>
      <td>Infinities</td>
      <td>Note, that these Numbers are bigger or smaller even than maximum or minimum possible values of type uint32.</td>
    </tr>
    <tr>
      <td><code>0.123~</code>, <code>-384.7583~</code></td>
      <td>Approximate floats</td>
      <td>Special literals for tabtests and for expected outputs only. Since we're dealing with floats in the XOD some math can give us float numbers like <code>0.49999999999</code> or sometimes the same calculation may give us <code>0.50000000001</code>, but both of them expected as <code>0.5</code>. Alternatively, another one example: <code>-384.75833333</code> can be expected as <code>-384.7583</code>. So when you put a tilde at the end of the number it tells to test runner with desired precision we want to test: <code>0.5~</code> or <code>-384.7583~</code>. All the next numbers are rounded.</td>
    </tr>
  </tbody>
</table>

### Strings

<table class="ui table compact">
  <thead>
    <tr>
      <th>Literal</th>
      <th>Meaning</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody class="top aligned">
    <tr>
      <td><code>"Hello, World!"</code></td>
      <td>String</td>
      <td>Note that string should be enquoted</td>
    </tr>
    <tr>
      <td><code>"He said: \"Hello\""</code></td>
      <td>String with quotes</td>
      <td>To use quotes inside string escape them with backslashes</td>
    </tr>
  </tbody>
</table>

### Booleans

<table class="ui table compact">
  <thead>
    <tr>
      <th>Literal</th>
      <th>Meaning</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody class="top aligned">
    <tr>
      <td><code>true</code></td>
      <td>True</td>
      <td></td>
    </tr>
    <tr>
      <td><code>false</code></td>
      <td>False</td>
      <td></td>
    </tr>
  </tbody>
</table>

### Pulses

<table class="ui table compact">
  <thead>
    <tr>
      <th>Literal</th>
      <th>Meaning</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody class="top aligned">
    <tr>
      <td><code>pulse</code></td>
      <td>Send or Expect Pulse</td>
      <td>If <code>pulse</code> is defined for input it means that we send pulse. For output — expecting pulse in this transaction.</td>
    </tr>
    <tr>
      <td><code>no-pulse</code></td>
      <td>Do not send or expect no pulse</td>
      <td>If <code>no-pulse</code> is defined for input it means that we do not send pulse. For output — expecting there will be no pulse in this transaction.</td>
    </tr>
  </tbody>
</table>

## Time flow column

Name the column: `__time(ms)`

Values can be non-negative integers.

If you test something with `defer` nodes inside, do not forget to increment the time on each test case or `defer` node on the execution of the next test case will think that is the same transaction and won't fire the output pulse or output-value.
