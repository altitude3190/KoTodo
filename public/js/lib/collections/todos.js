App.TodoCollection = Backbone.Collection.extend({

    url: '/api/todos/',
    model: App.Todo,

    parse: function(response) {
        return response.todos;
    }

});
