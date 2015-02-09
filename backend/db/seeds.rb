exercise_attrs = [
  { name: 'Atmosphere', description: 'Imagine you are in a cathedral.' },
  { name: 'Centers', description: 'Identify and move from a particular center.' },
  { name: 'Repetiion', description: 'Listen to your partner and repeat what they say.' }
]

exercise_attrs.each do |attrs|
  exercise = Exercise.find_by(attrs)

  if exercise.present?
    puts "Exercise '#{attrs[:name]}' already in the database."
  else
    Exercise.create(attrs)
    puts "Exercise '#{attrs[:name]}' created."
  end
end

exercises = Exercise.all

workout_attrs = [
  {
    name: 'Vocal warmup',
    description: 'A series of Linklater exercises.',
    exercises: [exercises.first, exercises.last] },
  {
    name: 'Physical warmup',
    description: 'Relaxation exercises.',
    exercises: [exercises[1], exercises.last]
  },
  {
    name: 'Imagination',
    description: 'Three Chekhov imagination exercises.',
    exercises: exercises
  }
]

workout_attrs.each do |attrs|
  details = {
    name: attrs[:name],
    description: attrs[:description]
  }
  workout = Workout.find_by(details)

  if workout.present?
    puts "Workout '#{attrs[:name]}' already in the database."
  else
    puts "Workout '#{attrs[:name]}' created."
    workout = Workout.create(details)

    attrs[:exercises].map do |exercise|
      WorkoutExercise.create(workout: workout, exercise: exercise)
    end
  end
end
