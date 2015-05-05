App.TodoItemView = Backbone.View.extend({

    tagName: 'li',
    className: 'list-group-item',

    template: _.template($('#tmpl-todo-item').html()),

    render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    },

});
