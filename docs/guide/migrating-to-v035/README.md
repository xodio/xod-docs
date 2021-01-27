---
title: Migrating C++ Implementations to v0.35 Syntax
version: 0.35.0
---

# Migrating C++ Implementations to v0.35 Syntax

Before 0.35, C++ implementations of XOD nodes looked like this:

```cpp
// a special marker to put code in the global scope
\{{#global}}
#include <SPI.h>
#include <SD.h>
\{{/global}}

// A struct to keep node state.
// Must be declared even if the node is stateless.
struct State {
    Number foo;
};

// a special marker between `State` and `evaluate`
\{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    auto state = getState(ctx); // accessing state struct
    state->foo++; // manipulating state
    // ...
}
```

In XOD v0.35, we introduced new implementation syntax that feels more like native C\++ and gets rid of a few quirks.

<div class="ui segment note">
<span class="ui ribbon label">Note</span>

Implementations with old syntax will continue to work.

</div>

Let's take a look at a few cases.

## Stateless nodes

Before 0.35:

```cpp
// `State` struct must be declared even if it's not used
struct State {};

\{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    // ...
}
```

After:

```cpp
// no separate `State` struct

// no `GENERATED_CODE` marker

node {
    void evaluate(Context ctx) {
        // ...
    }
}
```

## Nodes with state

Before:

```cpp
struct State {
    Number foo;
};

\{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    auto state = getState(ctx); // accessing state struct
    state->foo++; // manipulating state
    // ...
}
```

After:

```cpp
node {
    // just like fields in a regular C++ struct
    Number foo;

    void evaluate(Context ctx) {
        // no more `getState`
        foo++; // use the fields directly
        // ...
    }
}
```

## Global scope and including libraries

Before:

```cpp
// all code in the implementation was inside node namespace by default

// a special marker to put code in the global scope
\{{#global}}
#include <SPI.h>
#include <SD.h>
\{{/global}}

struct State {};

\{{ GENERATED_CODE }}

void evaluate(Context ctx) {
  // ...
}
```

After:

```cpp
// everything outside `node` is global by default,
// no special markers needed
#include <SPI.h>
#include <SD.h>

// explicitly put something in node namespace
nodespace {
    static const unsigned char bitmap[] PROGMEM = {/* ... */};
}

node {
    Foo foo = Foo(bitmap);

    void evaluate(Context ctx) {
        // ...
    }
}
```

## Accessing pin types

Before:

```cpp
struct State {
    // `ValueType<output_OUT>::T` was not available
    // before GENERATED_CODE marker
    // and could not be used to declare state
};

\{{ GENERATED_CODE }}

void evaluate(Context ctx) {
   ValueType<output_OUT>::T foo = {};
  // ...
}
```

After:

```cpp
node {
    // much simpler syntax,
    // available everywhere inside `node` struct
    typeof_IN previous = {};

    void evaluate(Context ctx) {
        typeof_OUT foo = {};
        // ...
    }
}
```

## Defining custom types

Before:

```cpp
struct State {};

using Type = XColor;

\{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    Type color = getValue<output_OUT>(ctx);
    emitValue<output_OUT>(ctx, color);
}
```

After:

```cpp
node {
    // Type definition is moved inside `node` and is wrapped in `meta`
    meta {
        using Type = XColor;
    }

    void evaluate(Context ctx) {
        Type color = getValue<output_OUT>(ctx);
        emitValue<output_OUT>(ctx, color);
    }
}
```
