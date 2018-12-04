App.Routers = Backbone.Router.extend({

    routes: {
        '': 'index',
        'new': 'showRegistForm',
    },

    index: function() {
        new App.HeaderView().show();

        App.todoCollection.fetch({
            success: function(collection, res, options) {
                new App.TodoListView().show();
            },
            error: function(collection, res, options) {
                // TODO: decide error management in detail
                alert('Connection Error');
            }
        });
    },

    showRegistForm: function() {
        // delete the header view which includes the 'New Task' button
        App.headerContainer.empty();

        var todoRegistFormView = new App.TodoRegistFormView();
        todoRegistFormView.show();

        var that = this;
        todoRegistFormView.on('submit:todo-regist-form', function(attrs) {
            that.index();
            that.navigate('/');
        });
    },

});
