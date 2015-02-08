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
