var starApp = starApp || {
  models: {},
  views: {},
  collections: {},
};

starApp.models.Star = Backbone.Model.extend({
  defaults: {
    name: "",
    mass: "",
    orbit: "",
    picture: "http://www.ipad-wallpapers.us/bgs/universe.jpg",
  }
});

starApp.collections.StarCollection = Backbone.Collection.extend({
  model: starApp.models.Star
});

starApp.views.StarView = Backbone.View.extend({
  tagName: 'li',
  events: { 'click .remove': 'remove'},

  remove: function() {
    this.model.destroy();
  },

  render: function() {
    var templateContents = $('#tmpl_star').html();
    var template = _.template(templateContents);
    this.$el.html(template({star: this.model}));
    return this;
  }
});

starApp.views.StarCollectionView = Backbone.View.extend({
  el: '#container2',
  events: {'submit form#add_star': 'addStarFromEvent'},

  initialize: function() {
    this.collection = new starApp.collections.StarCollection();
    this.collection.bind('add', this.render, this);
    this.collection.bind('remove', this.render, this);
  },

  add: function(name, mass, orbit, picture) {
    var star = new starApp.models.Star({name: name, mass: mass, orbit: orbit, picture: picture});
    this.collection.add(star);
  },

  addStarFromEvent: function(ev) {
    ev.preventDefault();
    var $name = $('#name');
    var $mass = $('#mass');
    var $orbit = $('#orbit');
    var $picture = $('#picture');
    this.add($name.val(), $mass.val(), $orbit.val(), $picture.val());
    $name.val('');
    $mass.val('');
    $orbit.val('');
    $picture.val('http://www.ipad-wallpapers.us/bgs/universe.jpg');
  },

  render: function() {
    $('#demo_stars').empty();
    this.collection.each(function(el) {
      var starView = new starApp.views.StarView({model: el});
      $('#demo_stars').append(starView.render().el);
    });
  }
});

starApp.setup = function() {
  var star = new starApp.views.StarCollectionView();
  star.add('Sun', '100kg', '8.2', 'http://www.webweaver.nu/clipart/img/nature/planets/sun-wearing-sunglasses.png');
};

$(starApp.setup)

