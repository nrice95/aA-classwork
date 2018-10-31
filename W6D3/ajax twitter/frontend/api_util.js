const APIUtil = {
  followUser: that => {
    // ...
    return $.ajax({
      method: "POST",
      url: `/users/${that.userId}/follow`,
      dataType: 'json'
    }).then(() => {
      that.followState = "followed";
      that.render();
    }).fail(() => console.log("failed!"));
  },

  unfollowUser: that => {
    // ...
    return $.ajax({
      method: "DELETE",
      url: `/users/${that.userId}/follow`,
      dataType: 'json'
    }).then(() => {
      that.followState = "unfollowed";
      that.render();
    }).fail(() => console.log("failed!"));
  }
};

module.exports = APIUtil;

// e.preventDefault();
// if (this.followState === "unfollowed") {
//   // debugger
//   return $.ajax({
//     method: "POST",
//     url: `/users/${this.userId}/follow`,
//     dataType: 'json'
//   }).then(() => {
//     this.followState = "followed";
//     this.render();
//   }).fail(() => console.log("failed!"));
// } else {
//   // debugger
//   return $.ajax({
//     method: "DELETE",
//     url: `/users/${this.userId}/follow`,
//     dataType: 'json'
//   }).then(() => {
//     this.followState = "unfollowed";
//     this.render();
//   }).fail(() => console.log("failed!"));
// }
