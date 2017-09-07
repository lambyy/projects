/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);
const TweetCompose = __webpack_require__(4);


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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);


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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: (id) => {
    return $.ajax({
      method: 'POST',
      url: `/users/${id}/follow`,
      dataType: 'json',
    });
  },
  unfollowUser: (id) => {
    return $.ajax({
      method: 'DELETE',
      url: `/users/${id}/follow`,
      dataType: 'json',
    });
  },

  searchUsers: (queryVal) => {
    return $.ajax({
      method: 'GET',
      url: '/users/search',
      data: {query: queryVal},
      dataType: 'json'
    });
  },

  createTweet: (data) => {
    return $.ajax({
      method: 'POST',
      url: '/tweets',
      data: data,
      dataType: "JSON"
    });
  }
};






module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

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


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);


class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.submit();
    this.inputHandler();
    this.addMentionedUser();
  }

  clearInput() {
    const $inputs = this.$el.find(':input');

    $inputs.each(function(index, input) {
      $(input).prop('disable', false);
      $(input).val("");
    });
    $('.mentioned-users').empty();
    this.$el.find(':submit').val("Post Tweet!");
  }

  inputHandler() {
    const $textBox = this.$el.find('textarea').first();

    $textBox.on("keyup", (event) => {
      let chars = 140 - $textBox.val().length;
      $('strong').text(chars);
    });
  }

  addMentionedUser() {
    $('a.add-mentioned-user').on('click', event => {
      const $script = this.$el.find('script').first();
      $('.mentioned-users').append($script.html());
      this.removeMentionedUser();
      return false;
    });
  }

  removeMentionedUser() {
    $('.mention').on('click', event => {
      const $div = $(event.currentTarget);
      console.log($div);

      if ($div.find("a").is(event.target)) {
        $div.remove();
      }
      return false;
    });
  }

  handleSuccess(tweet){
    this.clearInput();
    const ulId = this.$el.data('tweets-ul');
    const $ul = $(ulId);
    const $li = $('<li>');
    $li.text(JSON.stringify(tweet));
    $ul.prepend($li);

  }

  submit() {
    this.$el.on('submit', (event) => {
      const $currentTarget = $(event.currentTarget);
      event.preventDefault();

      const tweetObj = $currentTarget.serializeJSON();


      APIUtil.createTweet(tweetObj).then(this.handleSuccess.bind(this));


      const $inputs = this.$el.find(':input');

      $inputs.each(function(index, input) {
        $(input).prop('disable', true);
      });
    });

  }
}


module.exports = TweetCompose;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map