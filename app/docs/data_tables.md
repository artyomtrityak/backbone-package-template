# Creating "Data Tables"

For creating a data-table with pagination we have introduced the class `BasePaginatedView`.  
You can inherit it to create your own views like we did for the `UsersView`.  

The `BasePaginatedView` and its inheritors are intended to work with the collections inherited from [Backbone.Paginator.*](https://github.com/addyosmani/backbone.paginator/) collection.

`BasePaginatedView` agregates `PagesView`. You can inherit `PagesView` and define your own HTML template for it and then use your own class `MyOwnPagesView` in your `MyOwnPaginatedView`.

---

The classes hierarchy is described at the diagram **packages/organization/ood/class_diagram.png**