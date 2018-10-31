const APIUtil = require("./api_util.js");

class FollowToggle{
  constructor(el){
    this.$el = $(el);
    this.userId = el.dataset.userId;
    this.followState = el.dataset.initialFollowState;
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    // debugger
    if (this.followState === "unfollowed"){
      this.$el.text("Follow!");
    }else if (this.followState === "followed"){
      this.$el.text("Unfollow!");
    }else if (this.followState === "following"){
      this.$el.text("Wait! I'm trying to follow!");
    }else if (this.followState === "unfollowing"){
      this.$el.text("I'm unfollowing!");
    }else{
      this.$el.text("I'm broken, please fix me!");
    }
  }

  handleClick(e){
    e.preventDefault();
    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      return APIUtil.followUser(this);
    } else {
      this.followState = "unfollowing";
      this.render();
      return APIUtil.unfollowUser(this);
    }
  }
}

module.exports = FollowToggle;
