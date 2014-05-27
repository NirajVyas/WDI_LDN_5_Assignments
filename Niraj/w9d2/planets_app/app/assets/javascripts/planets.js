var Planets = Planets || {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  setup: function() {}
};

Planets.Models.Planet = Backbone.Model.extend({});
Planets.Collections.PlanetCollection = Backbone.Collection.extend({
  model: Planets.Models.Planet,
  url: '/planets'
});

//Show a single note
Planets.Views.PlanetView = Backbone.View.extend({
  tagName:'div',
  events: {'click h2': 'makeHeadLineEditable', 'blur input': 'saveChanges', 'keyup input': 'keyboardSaveChanges'},
  template: _.template($('#tmpl_planet').html()),

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
  },

  render: function() {
    this.$el.html(this.template({note: this.model}));
    return this;
  },

  makeHeadLineEditable: function(ev) {
    var $target = $(ev.currentTarget);
    var headline = $target.text();
    var newInput = $('<input>');
    newInput.val(headline);
    $target.replaceWith(newInput);
    newInput.focus();
  },

  keyboardSaveChanges: function(ev) {
    if (13 == ev.keyCode) {
      this.saveChanges(ev);
    } else if (27 == ev.keyCode) {
      this.render();
    }
  },

  saveChanges: function(ev) {
    var $target = $(ev.currentTarget);
    var newHeadLine = $target.val();
    this.model.set('title', newHeadLine);
    this.model.save();
  }

});

// Show all notes.
Planets.Views.PlanetCollectionView = Backbone.View.extend({
  el: '#container',
  render: function() {
    var that = this;
    this.$el.empty();
    this.collection.each(function(noteModel) {
      var planetView = new Planets.Views.PlanetView({model: planetModel});
      that.$el.append(noteView.render().el);
    });
    return this;
  } // End render function
});

// Show the form for a new note.
Planets.Views.PlanetCreationView = Backbone.View.extend({
  el: '#container',
  events: {'submit form': 'createNewNote'},
  template: _.template($('#tmpl_newplanet').html()),

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  createNewNote: function(ev) {
    ev.preventDefault();
    var name = $('input[name="name"]').val();
    var size = $('input[name="size"]').val();
    var distance = $('input[name="distance"]').val();

    var planet = new Planets.Models.Planet({name: name, size: size, distance: distance});
    Planets.allPlanets.add(planet);
    planet.save();
    Planets.router.navigate("", {trigger: true});              
  }
});

Planets.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "showIndex",
    "new": "createNewPlanet"
  },

  showIndex: function() {
    var collectionView = new Planets.Views.PlanetCollectionView({collection: Planets.allPlanets});
    collectionView.render();
  },
  createNewNote: function() {
    new Planets.Views.PlanetCreationView().render();
  }
});

Planets.setup = function() {
  Planets.router = new Planets.Routers.AppRouter();
  Planets.allPlanets = new Planets.Collections.PlanetCollection();
  Planets.allPlanets.fetch({ success: Planets.router.showIndex }); 
  Backbone.history.start();
};

$(Planets.setup);