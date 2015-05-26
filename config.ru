require "./lib/web_ui_controller"
require "./lib/codebreaker/game"
require "./lib/codebreaker/results_collection"
use Rack::Reloader, 0
use Rack::Static, :urls => ["/stylesheets"], :root => "public"
run WebUiController
 