const FollowToggle = require("./follow_toggle.js");

$(function(){
    $("button.follow-toggle").each(function(idx, el){
        let $el = $(el)
        new FollowToggle($el)
    })

})

