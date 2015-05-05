App.TodoRegistFormView = Backbone.View.extend({

    events: {'submit #todo-regist-form': 'addNewTodo'},

    template: _.template($('#tmpl-todo-form').html()),

    initialize: function() {
        this.container  = App.todoListContainer;
        this.collection = App.todoCollection;
    },

    render: function() {
        this.$el.html(this.template());
        return this;
    },

    show: function() {
        this.container.show(this);
    },

    addNewTodo: function(e) {
        // cancel submit processing of todo regist form
        e.preventDefault();

        var attrs = {};
        attrs.task = this.$('#task-content').val();
        attrs.deadline = this.$('#deadline').val();

        this.collection.create(attrs);

        this.trigger('submit:todo-regist-form', attrs);
    },

});
