App.HeaderView = Backbone.View.extend({

    template: _.template($("#tmpl-header").html()),

    initialize: function() {
        this.container  = App.headerContainer;
        this.collection = App.todoCollection;
    },

    render: function() {
        this.$el.html(this.template());
        return this;
    },

    show: function() {
        this.container.show(this);
    },

});
