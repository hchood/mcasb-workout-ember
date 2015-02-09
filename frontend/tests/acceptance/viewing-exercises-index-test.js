import Ember from 'ember';
import startApp from '../helpers/start-app';
import Pretender from 'pretender';

var application, server;

module('Acceptance: Viewing Exercises Index', {
  setup: function() {
    application = startApp();

    var exercises = [
      { id: 1, name: 'Atmosphere', description: 'Imagine you are in a cathedral.' },
      { id: 2, name: 'Centers', description: 'Identify and move from a particular center.' },
      { id: 3, name: 'Repetition', description: 'Listen to your partner and repeat what they say.' }
    ];

    server = new Pretender(function() {
      this.get('/api/v1/exercises', function(request) {
        return [200, {"Content-Type": "application/json"}, JSON.stringify({exercises: exercises})];
      });
    });
  },
  teardown: function() {
    Ember.run(application, 'destroy');
  }
});

test('Should allow navigation to the exercises page from the landing page', function() {
  visit('/').then(function() {
    click('a:contains("Exercises")');
  });

  andThen(function() {
    equal(find('h3').text(), 'Exercises');
  });
});

test('It lists each exercise', function() {
  visit('/exercises');

  andThen(function() {
    equal(find('a:contains("Atmosphere")').length, 1);
    equal(find('a:contains("Centers")').length, 1);
    equal(find('a:contains("Repetition")').length, 1);
  });
});
