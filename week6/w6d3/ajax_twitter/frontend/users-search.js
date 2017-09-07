const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input = this.$el.find('input');
    this.ul = this.$el.find('ul');
    this.handleInput();
  }

  renderResults(users) {
    console.log(users);
    this.ul.empty();

    for (let i = 0; i < users.length; i++) {
      const user = users[i];
      const $li = $('<li>');
      const $anchor = $('<a>');
      const $button = $('<button class="follow-toggle">');
      $button.data("user-id", user.id);
      $button.data("initial-follow-state", user.followed);
      new FollowToggle($button);

      $anchor.text(user.username).attr("href", `/users/${user.id}`);
      $li.append($anchor);
      $li.append($button);
      this.ul.append($li);
    }
  }

  handleInput() {
    this.input.on("keyup", event => {
      const $input = $(event.currentTarget);
      const queryVal = $input.val();

      APIUtil.searchUsers(queryVal).then(this.renderResults.bind(this));
    });
  }
}

module.exports = UsersSearch;
