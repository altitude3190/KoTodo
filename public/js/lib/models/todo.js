App.Todo = Backbone.Model.extend({

    initialize: function() {
        // set a collection to delegate to Collection#url
        this.collection = App.todoCollection;
    },

    defaults: {
        task:       'Study Computer Programming',
        deadline:   '1893423600',
        created_at: '1420038000',
        updated_at: '1420038000',
    },

});
