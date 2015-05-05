App.Container = Backbone.View.extend({

    show: function(view) {
        this._destroyView(this.currentView);
        this.$el.html(view.render().el);
        this.currentView = view;
    },

    empty: function() {
        this._destroyView(this.currentView);
        this.currentView = null;
    },

    _destroyView: function(view) {
        if(!view) return;
        view.off();
        view.remove();
    },

});
