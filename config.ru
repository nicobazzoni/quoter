require './config/environment'

use Rack::MethodOverride

use QuoteController
use CommentController
use UsersController
run ApplicationController


