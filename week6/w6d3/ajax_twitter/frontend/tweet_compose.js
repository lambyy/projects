const APIUtil = require('./api_util.js');


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
