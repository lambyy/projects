const APIUtil = require('./api_util.js');


class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followStateBoolean = this.$el.data("initial-follow-state");
    this.followState = this.followStateBoolean ? "Followed" : "Unfollowed";
    this.render();
    this.handleClick();
  }

  render() {
    switch (this.followState) {
      case 'Followed':
        this.$el.text('Unfollow!');
        this.$el.prop('disabled', false);
        break;
      case 'Unfollowed':
        this.$el.prop('disabled', false);
        this.$el.text('Follow!');
        break;
      case 'Following':
        this.$el.prop('disabled', true);
        this.$el.text('Following...');
        break;
      case 'Unfollowing':
      this.$el.prop('disabled', true);
        this.$el.text('Unfollowing...');
        break;
    }

  }

  setFollowState() {
    console.log('here!');
    this.followStateBoolean = !this.followStateBoolean;
    this.followState = this.followStateBoolean ? "Followed" : "Unfollowed";
    this.render();
  }

  handleClick() {
    this.$el.on("click", event => {

      event.preventDefault();

      if (this.followStateBoolean) {
        APIUtil.unfollowUser(this.userId).then(this.setFollowState.bind(this));
      } else {
        APIUtil.followUser(this.userId).then(this.setFollowState.bind(this));
      }


      this.followState = this.followStateBoolean ? "Unfollowing" : "Following";
      this.render();
    });
  }
}

module.exports = FollowToggle;
