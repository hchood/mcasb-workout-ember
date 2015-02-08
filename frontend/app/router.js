import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('exercises', function() {
    // index route auto-generated
  });
});

export default Router;
