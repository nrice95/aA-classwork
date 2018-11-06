# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

Todo.destroy_all

todo1 = Todo.new(title: "Take me out to the ball game", body: "Buy me some damn peanuts, not crackah jax", done: false)
todo2 = Todo.new(title: "Get a job", body: "Thanks aA", done: false)
todo3 = Todo.new(title: "Drink water", body: "Hydration is key", done: true)

todo1.save
todo2.save
todo3.save
