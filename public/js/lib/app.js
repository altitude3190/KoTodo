
// define name space
window.App = {
    initialize: function() {
        new App.Routers();
        Backbone.history.start();
    }
};

// execute
$(function() {

    // Container View
    App.todoListContainer = new App.Container({el: '#todo-list-container'});
    App.headerContainer   = new App.Container({el: '#header-container'});

    // Collection
    App.todoCollection = new App.TodoCollection();

    App.initialize();

});
