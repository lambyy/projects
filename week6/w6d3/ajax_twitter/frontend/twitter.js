const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users-search.js');
const TweetCompose = require('./tweet_compose.js');


$( () => {
    const $buttons = $('.follow-toggle');
    $buttons.each( function(index, button) {
      new FollowToggle(button);
    });

    const $navs = $('.users-search');
    $navs.each ( function(index, nav) {
      new UsersSearch(nav);
    });

    const $forms = $('.tweet-compose');
    $forms.each (function(index, form) {
      new TweetCompose(form);
    });

});
