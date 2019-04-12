---
title: State Machines and Mutexes: Advanced Traffic Light Example
version: 1.0.0
---

# State Machines and Mutexes: Advanced Traffic Light Example

In many devices it is desirable to control a single physical resource like memory, motor, or display with different nodes at different moments. If you place several hardware nodes which relate to the same thing and ask them to update continuously, you are in trouble: the thing will get conflicting signals one after each other and behave unpredictably.

You need some referee that will decide who may act at the given moment and forbid everyone other to interact with your exclusive resource. This referee is mutex. Mutex stands for “mutually exclusive.” You can acquire a lock of the mutex and until you release, it’s yours: other nodes which are trying to lock it for themselves will fail and refuse to start their jobs.

<Note>

If you have experience in classical programming you might be familiar with mutexes, locks, and semaphores. They are operation system objects to properly synchronize threads. In XOD they serve the similar purpose but are designed to resolve resource conflicts, not thread race conditions.

</Note>

To better understand this article we highly recommend to learn [Doing things sequentially](../simple-traffic-light/) first.

## Task

Let’s make a traffic light which can be in one of several states. On the top level it might be in either mode:

- Normal operation
- Blinking yellow (night or manual mode)

Inside the normal operation, let it cycle through the following states:

- Red
- Red + Yellow
- Green
- Green Blinking
- Yellow

In contrast to the basic example of doing things sequentially, this cycle involves resource conflicts. Various states want to control LEDs of the same color. We’ll resolve these conflicts with a mutex.

To complete the picture we’ll add a feature to hurry the switch with a button but only in the “Red” and “Green” modes. Also, we’ll add another button to immediatelly change the top-level mode ignoring the current sub-state.

## LED resource

To work with the three lights as with the whole, let’s [make a patch node](../nodes-for-xod-in-xod/) which will combine three [`led`](https://xod.io/libs/xod/common-hardware/led/) nodes into a single one.

![Lights node](TODO)

## State nodes

As we did while switching states sequentially, let’s create a new patch for each state we have.

### state-red
### state-red-yellow
### state-green
### state-green-blink
### state-yellow

## State machine

Now, we create a proper sequence out of the state nodes on the entry-point patch `main`:

![State machine patch main, naive version](TODO)

Upload the program and observe the result. The behavior is sporadic. That’s because all states try to take control over the `lights` node regardless of whether they are active or not.
