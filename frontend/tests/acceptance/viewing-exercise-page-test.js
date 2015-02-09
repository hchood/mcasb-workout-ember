import Ember from 'ember';
import startApp from '../helpers/start-app';
import Pretender from 'pretender';

var application, server;

module('Acceptance: Viewing Exercise Page', {
  setup: function() {
    application = startApp();

    var exercise = {
      id: 1,
      name: 'Repetition',
      description: 'Listen to your partner and repeat what they say.'
    };

    server = new Pretender(function() {
      this.get('/api/v1/exercises/:id', function(request) {
        return [200, {"Content-Type": "application/json"}, JSON.stringify({exercise: exercise})];
      });
    });
  },
  teardown: function() {
    Ember.run(application, 'destroy');
  }
});

test('exercise details are displayed', function() {
  visit('/exercises/1');

  andThen(function() {
    equal(find('h3:contains("Repetition")').length, 1);
    equal(find('div#description:contains("Listen to your partner and repeat what they say.")').length, 1);
  });
});
