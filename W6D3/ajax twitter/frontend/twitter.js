const FollowToggle = require("./follow_toggle.js");

$(() => {
  const $toggles = $('.follow-toggle');
  $toggles.each( function (i, el) {
    new FollowToggle(el);
  });
  // for (let i = 0; i < $toggles.length; i++){
  //   // new FollowToggle($toggles[i]);
  //   $toggles[i].text("Haalp");
  // }
});
