---
title: Using Your New Node
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
<span class="ui ribbon label">Note</span>
This is a web-version of a tutorial chapter embedded right into the XOD IDE.
To get a better learning experience we recommend to install the
<a href="/downloads/">desktop IDE</a> or start the
<a href="/ide/">browser-based IDE</a>, and you’ll see the same tutorial there.
</div>

# Using Your New Node

![Screenshot of 304-use-new-node](./304-use-new-node.patch.png)

Now you can use the new node just like any other.

## Instructions

1.  Drag’n’drop your `between` node from Project Browser to this patch and replace the `303-...` node with it.
2.  Add a few more `between`’s: double click on empty space and type “between”. Your node is here and denoted as `@/between`.
3.  Bind some values to the inputs of new `between` nodes, add some `tweak-number` and `watch` nodes to play.
4.  Run simulation to check how the new node works.

### Paths starting with @/

The at (_@_) symbol in the patch path shown by the quick search suggester denotes “_this project_”. That is, the node is located in the current projects, not in a library.

<- Place your `between` node instead

<div class="ui grid">
  <div class="five wide column left aligned ">
    <a href="../303-add-terminals/">← Previous lesson</a>
  </div>
  <div class="six wide column center aligned ">
    <a href="../">Index</a>
  </div>
  <div class="five wide column right aligned ">
    <a href="../305-document-it/">Next lesson →</a>
  </div>
</div>
