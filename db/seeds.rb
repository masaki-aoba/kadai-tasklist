(1..100).each do |number|
  Task.create(content: 'test title ' + number.to_s, status: number.to_s)
end
