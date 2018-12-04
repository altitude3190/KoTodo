App.TodoListView = Backbone.View.extend({

    tagName: 'ul',
    className: 'list-group',

    initialize: function() {
        this.container  = App.todoListContainer;
        this.collection = App.todoCollection;
    },

    render: function() {
        this.collection.each(function(item) {
            this.addTodoItemView(item);
        }, this);
        return this;
    },

    show: function() {
        this.container.show(this);
    },

    addTodoItemView: function(item) {
        var todoItemView = new App.TodoItemView({model: item});
        this.$el.append(todoItemView.render().el);
    },

});
