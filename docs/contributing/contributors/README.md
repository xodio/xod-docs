---
title: Contributors
---

# Contributors

These people have spent their time and energy to make XOD a better system. Thank you, folks, your contribution is precious!

<div class="ui four cards">
  {{#each people}}
    <div class="fluid card">
      <a class="image"><img src="https://pm.xod.io/users/{{ username }}/avatar?size=200x200" /></a>
      <div class="content">
        <a class="ui tiny header" href="https://xod.io/users/{{ username }}">{{ username }}</a>
        {{#if activities.onsite}}
          <i class="ui large fitted grey building icon" title="Onsite developer (ex or current)"></i>
        {{/if}}
        {{#if activities.videos}}
          <i class="ui large fitted black video icon" title="Filming videos"></i>
        {{/if}}
        {{#if activities.articles}}
          <i class="ui large fitted orange pencil icon" title="Writing articles and tutorials"></i>
        {{/if}}
        {{#if activities.events}}
          <i class="ui large fitted brown bullhorn icon" title="Conferences, workshops, hackathons"></i>
        {{/if}}
        {{#if activities.code}}
          <i class="ui large fitted black keyboard icon" title="Contributing code to XOD core and IDE"></i>
        {{/if}}
        {{#if activities.libs}}
          <i class="ui large fitted pink gift icon" title="Making popular libraries"></i>
        {{/if}}
        {{#if activities.translation}}
          <i class="ui large fitted green globe icon" title="Translating documentation and other materials"></i>
        {{/if}}
        {{#if activities.textfix}}
          <i class="ui large fitted black i cursor icon" title="Fixing texts, improve wording"></i>
        {{/if}}
        {{#if activities.replying}}
          <i class="ui large fitted violet life ring icon" title="Replying to people on forum and social media"></i>
        {{/if}}
        {{#if activities.ideas}}
          <i class="ui large fitted orange lightbulb icon" title="Suggesting and discussing clever ideas"></i>
        {{/if}}
        {{#if activities.bugs}}
          <i class="ui large fitted green bug icon" title="Reporting bugs on GitHub"></i>
        {{/if}}
      </div>
    </div>
  {{/each}}
</div>

---

You can help XOD too in [numerous of ways](../) not necessarily related to writing code. Feel free to [add yourself to the list][1], or we’ll ask you to do it otherwise.

[1]: https://github.com/xodio/xod-docs/edit/master/docs/contributing/contributors/people.yaml "Edit on GitHub"

<script>
$('img').one('error', function() { this.src = 'no-avatar.png'; });
</script>
