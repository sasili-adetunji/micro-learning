require './config/environment'

use Rack::MethodOverride
use UserController
use TopicController
use ResourceController
run ApplicationController
