class FollowToggle {
    constructor(el) {
        let $el = $(el);
        // console.log($el)
        // console.log(el)
        this.userId = $el.data('user-id');
        this.followState = $el.data('initial-follow-state');
        this.render($el);
        this.handleClick()
    }
};

FollowToggle.prototype.render = function($el){
    if (this.followState === "unfollowed"){
        $el.text("Follow!")
    } else if (this.followState === "followed") {        
        $el.text("Unfollow!")
    }
}


FollowToggle.prototype.handleClick = function(){
    $("button.follow-toggle").on('click', e => {
        e.preventDefault();
        if (this.followState === "unfollowed"){
            this.followState = "followed"
            $.ajax({
                url: "/users/:id/follow",
                method: "POST",
                data: user: {user_id: "$(e.target).data('user-id')"},
                dataType: "json",
                success: res => console.log(res),
                error: err => console.log(err)
            })
            this.render($(e.target))
        } else {
            this.followState = "unfollowed"
            $.ajax({
                url: "/users/:id/follow",
                method: "DELETE",
                data: {},
                dataType: "json",
            })
            this.render($(e.target))
        }
    })
}




module.exports = FollowToggle
