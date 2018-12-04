App.TodoItemView = Backbone.View.extend({

    tagName: 'li',
    className: 'list-group-item',

    template: _.template($('#tmpl-todo-item').html()),

    events: { 'click .delete-todo-btn': 'destroyModel'},

    initialize: function() {
        this.listenTo(this.model, 'destroy', this.remove);
    },

    render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    },

    destroyModel: function () {
        this.model.destroy();
    },

});
